
-- Diretório principal para salvar as configurações
local MAIN_DIRECTORY = "/bot/" .. modules.game_bot.contentsPanel.config:getCurrentOption().text .. "/storage/" .. g_game.getWorldName() .. "/"
local STORAGE_DIRECTORY = MAIN_DIRECTORY .. name() .. "_exitKamui.json"

-- Inicializa o perfil padrão
local profile = {
    _storage = {
        exitKamui = { enabled = false }
 
    }
}

-- Cria o diretório se não existir
if not g_resources.directoryExists(MAIN_DIRECTORY) then
    g_resources.makeDir(MAIN_DIRECTORY)
end

-- Função para carregar as configurações do JSON
local function load_file()
    if g_resources.fileExists(STORAGE_DIRECTORY) then
        local content = g_resources.readFileContents(STORAGE_DIRECTORY)
        local status, result = pcall(json.decode, content)
        if status and result and result._storage then
            profile._storage = result._storage
            warn("Configurações carregadas com sucesso!")
        else
            warn("Erro ao carregar as configurações.")
        end
    else
        warn("Arquivo de configurações não encontrado. Usando configurações padrão.")
    end
end

-- Função para salvar as configurações no JSON
local function save_file()
    local res = json.encode(profile, 4)
    local status, err = pcall(function() g_resources.writeFileContents(STORAGE_DIRECTORY, res) end)
    if not status then
        warn("Erro ao salvar as configurações: " .. err)
    else
        warn("Configurações salvas com sucesso!")
    end
end


-- Carrega as configurações ao iniciar o bot
load_file()

-- Configuração do checkbox AutoTask
local checkBoxExitKamui = setupUI([[
CheckBox
  id: checkBox
  font: cipsoftFont
  text: Exit Kamui
]])


checkBoxExitKamui.onCheckChange = function(widget, checked)
    profile._storage.exitKamui.enabled = checked
    save_file() -- Salva imediatamente após a mudança
end

checkBoxExitKamui:setChecked(profile._storage.exitKamui.enabled)

onTextMessage(function(mode, text)
  if not text:lower():find('voce esta no mundo do kamui') then return; end
	if profile._storage.exitKamui.enabled then
      CaveBot.gotoLabel('sairKamui')
      end
end)
