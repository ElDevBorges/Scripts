
-- Diret�rio principal para salvar as configura��es
local MAIN_DIRECTORY = "/bot/" .. modules.game_bot.contentsPanel.config:getCurrentOption().text .. "/storage/" .. g_game.getWorldName() .. "/"
local STORAGE_DIRECTORY = MAIN_DIRECTORY .. name() .. "_exitKamui.json"

-- Inicializa o perfil padr�o
local profile = {
    _storage = {
        exitKamui = { enabled = false }
 
    }
}

-- Cria o diret�rio se n�o existir
if not g_resources.directoryExists(MAIN_DIRECTORY) then
    g_resources.makeDir(MAIN_DIRECTORY)
end

-- Fun��o para carregar as configura��es do JSON
local function load_file()
    if g_resources.fileExists(STORAGE_DIRECTORY) then
        local content = g_resources.readFileContents(STORAGE_DIRECTORY)
        local status, result = pcall(json.decode, content)
        if status and result and result._storage then
            profile._storage = result._storage
            warn("Configura��es carregadas com sucesso!")
        else
            warn("Erro ao carregar as configura��es.")
        end
    else
        warn("Arquivo de configura��es n�o encontrado. Usando configura��es padr�o.")
    end
end

-- Fun��o para salvar as configura��es no JSON
local function save_file()
    local res = json.encode(profile, 4)
    local status, err = pcall(function() g_resources.writeFileContents(STORAGE_DIRECTORY, res) end)
    if not status then
        warn("Erro ao salvar as configura��es: " .. err)
    else
        warn("Configura��es salvas com sucesso!")
    end
end


-- Carrega as configura��es ao iniciar o bot
load_file()

-- Configura��o do checkbox AutoTask
local checkBoxExitKamui = setupUI([[
CheckBox
  id: checkBox
  font: cipsoftFont
  text: Exit Kamui
]])


checkBoxExitKamui.onCheckChange = function(widget, checked)
    profile._storage.exitKamui.enabled = checked
    save_file() -- Salva imediatamente ap�s a mudan�a
end

checkBoxExitKamui:setChecked(profile._storage.exitKamui.enabled)

onTextMessage(function(mode, text)
  if not text:lower():find('voce esta no mundo do kamui') then return; end
	if profile._storage.exitKamui.enabled then
      CaveBot.gotoLabel('sairKamui')
      end
end)
