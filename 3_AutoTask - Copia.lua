setDefaultTab("scripts")

-------------




-- Diret�rio principal para salvar as configura��es
local MAIN_DIRECTORY = "/bot/" .. modules.game_bot.contentsPanel.config:getCurrentOption().text .. "/storage/" .. g_game.getWorldName() .. "/"
local STORAGE_DIRECTORY = MAIN_DIRECTORY .. name() .. "_config.json"

-- Inicializa o perfil padr�o
local profile = {
    _storage = {
        autoTask = { enabled = false },
        autoTaksu = { enabled = false },
        autoChouji = { enabled = false }
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
local checkBoxAutoTask = setupUI([[
CheckBox
  id: checkBox
  font: cipsoftFont
  text: AutoTask
]])

checkBoxAutoTask.onCheckChange = function(widget, checked)
    profile._storage.autoTask.enabled = checked
    save_file() -- Salva imediatamente ap�s a mudan�a
end

checkBoxAutoTask:setChecked(profile._storage.autoTask.enabled)

-- Configura��o do checkbox Taksu
local checkBoxAutoTaksu = setupUI([[
CheckBox
  id: checkBox
  font: cipsoftFont
  text: Taksu
]])

checkBoxAutoTaksu.onCheckChange = function(widget, checked)
    profile._storage.autoTaksu.enabled = checked
    save_file() -- Salva imediatamente ap�s a mudan�a
end

checkBoxAutoTaksu:setChecked(profile._storage.autoTaksu.enabled)

-- Configura��o do checkbox Chouji
local checkBoxAutoChouji = setupUI([[
CheckBox
  id: checkBox
  font: cipsoftFont
  text: Chouji
]])

checkBoxAutoChouji.onCheckChange = function(widget, checked)
    profile._storage.autoChouji.enabled = checked
    save_file() -- Salva imediatamente ap�s a mudan�a
end

checkBoxAutoChouji:setChecked(profile._storage.autoChouji.enabled)

-- Fun��es para verificar o estado dos checkboxes
function isAutoTaskEnabled()
    return profile._storage.autoTask.enabled
end

function isAutoTaksuEnabled()
    return profile._storage.autoTaksu.enabled
end

function isAutoChoujiEnabled()
    return profile._storage.autoChouji.enabled
end

treinoo = macro(100, "treinar", function ()
    if manapercent() >= 50 then say "powerdown" 
end
end)




--------------------------




-- Original Timer Widget
local widgetTC = setupUI([[
Panel
  size: 500 750
  anchors.bottom: parent.bottom
  anchors.left: parent.left
  Label
    id: lblTimer
    color: green
    font: verdana-11px-rounded
    height: 12
    background-color: #00000040
    opacity: 0.87
    text-auto-resize: true
    !text: tr('00:00:00')
]], g_ui.getRootWidget())

-- Second Timer Widget
local widgetTC2 = setupUI([[
Panel
  size: 500 750
  anchors.bottom: parent.bottom
  anchors.right: parent.right
  Label
    id: lblTimer2
    color: blue
    font: verdana-11px-rounded
    height: 12
    background-color: #00000040
    opacity: 0.87
    text-auto-resize: true
    !text: tr('00:00:00')
]], g_ui.getRootWidget())

-- terceiro Timer Widget
local widgetTC3 = setupUI([[
Panel
  size: 500 750
  pos: 500 0
  margin-bottom: 20
  Label
    id: lblTimer3
    color: yellow
    font: verdana-11px-rounded
    height: 12
    background-color: #00000040
    opacity: 0.87
    text-auto-resize: true
    !text: tr('00:00:00')
]], g_ui.getRootWidget())

if not storage.endTime3 then
    storage.endTime3 = 0
end

if not storage.endTime then
    storage.endTime = 0
end

if not storage.endTime2 then
    storage.endTime2 = 0
end

local function doFormatTime(v)
    local hours = string.format("%02.f", math.floor(v / 3600))
    local mins = string.format("%02.f", math.floor(v / 60 - (hours * 60)))
    local seconds = string.format("%02.f", math.floor(math.fmod(v, 60)))
    return hours .. ":" .. mins .. ":" .. seconds
end

tmrMacro = macro(1, function()
    if os.time() >= storage.endTime then
        widgetTC.lblTimer:setText('00:00:00')
        return
    end
    widgetTC.lblTimer:setText(doFormatTime(os.difftime(storage.endTime, os.time())))
end)

tmrMacro2 = macro(1, function()
       if os.time() >= storage.endTime and os.time() >= storage.endTime2 and os.time() < storage.endTime3 then
        widgetTC2.lblTimer2:setText('00:00:00')
		irTaksu()
		tmrMacro2:setOff()


        return
    end
     local remainingTime = os.difftime(storage.endTime2, os.time())
    if remainingTime < 0 then
        remainingTime = 0
    end
    widgetTC2.lblTimer2:setText(doFormatTime(remainingTime))

end)

tmrMacro3 = macro(1, function()
    if os.time() >= storage.endTime3 then
        widgetTC3.lblTimer3:setText('00:00:00')
	
		irZoltan()
		tmrMacro3:setOff()

        return
    end
	 local remainingTime2 = os.difftime(storage.endTime3, os.time())
    if remainingTime2 < 0 then
        remainingTime2 = 0
    end
      widgetTC3.lblTimer3:setText(doFormatTime(remainingTime2))
end)

if not contagem then
    contagem = 0
end

if not contagemTaksu then
    contagemTaksu = 0
end

if not famaentregue then
    famaentregue = false
end



function irTaksu ()
	if not  profile._storage.autoTaksu.enabled then return end
	for _, spec in ipairs (getSpectators()) do
		if spec:isCreature() and spec ~= player then
			local specName = spec:getName():lower()
			if specName == "trainer" then
			TargetBot.setOff()
			tyrBot.storage._configs.targetbot_configs.selected = 'others'
			CaveBot.setOff()
			FollowAttack.mainMacro.setOff()
			tyrBot.storage._configs.cavebot_configs.selected = 'Voltarzoltan'
			CaveBot.setOn()
			end
		end
	end
	end

	function irZoltan ()
	if not profile._storage.autoTask.enabled then return end
	for _, spec in ipairs (getSpectators()) do
		if spec:isCreature() and spec ~= player then
			local specName = spec:getName():lower()
			if specName == "trainer" then

			TargetBot.setOff()
			tyrBot.storage._configs.targetbot_configs.selected = 'others'
			TargetBot.setOn()
			CaveBot.setOff()
			FollowAttack.mainMacro.setOff()
			tyrBot.storage._configs.cavebot_configs.selected = 'trainerparaZoltan'
			CaveBot.setOn()
			end
		end
	end
	end




------------------------------------------------------------------------


onTalk(function(name, level, mode, text, channelId, pos)
    if (mode ~= 51) then return; end
  if not profile._storage.autoTask.enabled then return end
    if not text:lower():find('voce ativou a task de fama') then return; end
	emFortress = false
    storage.endTime = os.time() + 6 * 3600
	storage.endTime3 = os.time() + 12 * 3600
    tmrMacro:setOn()
	tmrMacro3:setOn()
end)


onTextMessage(function(mode, text)

  if not text:lower():find('finalizou sua task de fama') then return; end
  if not profile._storage.autoTask.enabled then return end
  storage.endTime = os.time() + 6 * 0
end)


onTalk(function(name, level, mode, text, channelId, pos)
  if (mode ~= 51) then return; end
  if not text:lower():find('sua task foi removida') then return; end
  if not  profile._storage.autoTaksu.enabled then return end
 storage.endTime2 = os.time() + 2 * 3600
 contagemTaksu = 0
tmrMacro2:setOn()
  if not profile._storage.autoTask.enabled then return end
CaveBot.setOff()
	tyrBot.storage._configs.cavebot_configs.selected = 'Zoltan'
	CaveBot.setOn()
   return true;
end)

onTalk(function(name, level, mode, text, channelId, pos)
  if (mode ~= 51) then return; end
  if not text:lower():find('aqui esta seu premio') then return; end
  if not  profile._storage.autoTaksu.enabled then return end
	contagemTaksu = 1
	contagem = contagem + 1
	storage.endTime2 = os.time() + 6 * 3600
	tmrMacro2:setOn()
	CaveBot.setOff()
	tyrBot.storage._configs.cavebot_configs.selected = 'Zoltan'
	CaveBot.setOn()
return true;
end)





--------------------------------------------------------------------------


onTalk(function(name, level, mode, text, channelId, pos)
if not  profile._storage.autoTaksu.enabled then return end
  if (mode ~= 51) then return; end
  
  if not text:lower():find('black shinobis') then return; end
  CaveBot.setOff()
  tyrBot.storage._configs.cavebot_configs.selected = 'Blackshinobis'
  CaveBot.setOn()



   return true;
end)

onTalk(function(name, level, mode, text, channelId, pos)
if not  profile._storage.autoTaksu.enabled then return end
  if (mode ~= 51) then return; end
  if not text:lower():find('akanames') then return; end
  CaveBot.setOff()
  tyrBot.storage._configs.cavebot_configs.selected = 'Akanamestaksu'
  CaveBot.setOn()

   return true;
end)

onTalk(function(name, level, mode, text, channelId, pos)
if not  profile._storage.autoTaksu.enabled then return end
  if (mode ~= 51) then return; end
  if not text:lower():find('mamushis') then return; end
  CaveBot.setOff()
  tyrBot.storage._configs.cavebot_configs.selected = 'Mamushitaksu'
  CaveBot.setOn()

   return true;
end)

onTalk(function(name, level, mode, text, channelId, pos)
if not  profile._storage.autoTaksu.enabled then return end
  if (mode ~= 51) then return; end
  if not text:lower():find('irankis') then return; end
  CaveBot.setOff()
  tyrBot.storage._configs.cavebot_configs.selected = 'Irankitaksu'
  CaveBot.setOn()

   return true;
end)

onTalk(function(name, level, mode, text, channelId, pos)
if not  profile._storage.autoTaksu.enabled then return end
  if (mode ~= 51) then return; end
  if not text:lower():find('shinobi archers') then return; end
  CaveBot.setOff()
  tyrBot.storage._configs.cavebot_configs.selected = 'Shinobiarchers'
  CaveBot.setOn()

   return true;
end)

onTalk(function(name, level, mode, text, channelId, pos)
if not  profile._storage.autoTaksu.enabled then return end
  if (mode ~= 51) then return; end
  if not text:lower():find('kuroaris') then return; end
  CaveBot.setOff()
  tyrBot.storage._configs.cavebot_configs.selected = 'Kuroaris'
  CaveBot.setOn()

   return true;
end)

onTalk(function(name, level, mode, text, channelId, pos)
if not  profile._storage.autoTaksu.enabled then return end
  if (mode ~= 51) then return; end
  if not text:lower():find('nukenins') then return; end
  CaveBot.setOff()
  tyrBot.storage._configs.cavebot_configs.selected = 'Nukenin'
  CaveBot.setOn()

   return true;
end)

onTalk(function(name, level, mode, text, channelId, pos)
if not  profile._storage.autoTaksu.enabled then return end
  if (mode ~= 51) then return; end
  if not text:lower():find('venom snakes') then return; end
  CaveBot.setOff()
   tyrBot.storage._configs.cavebot_configs.selected = 'Venomsnake'
  CaveBot.setOn()

   return true;
end)

onTalk(function(name, level, mode, text, channelId, pos)
if not  profile._storage.autoTaksu.enabled then return end
  if (mode ~= 51) then return; end
  if not text:lower():find('tayuyas') then return; end
  CaveBot.setOff()
   tyrBot.storage._configs.cavebot_configs.selected = 'Tayuyas'
  CaveBot.setOn()

   return true;
end)

onTalk(function(name, level, mode, text, channelId, pos)
if not  profile._storage.autoTaksu.enabled then return end
  if (mode ~= 51) then return; end
  if not text:lower():find('dog fears') then return; end
  CaveBot.setOff()
   tyrBot.storage._configs.cavebot_configs.selected = 'Dogfears'
  CaveBot.setOn()

   return true;
end)

onTalk(function(name, level, mode, text, channelId, pos)
if not  profile._storage.autoTaksu.enabled then return end
  if (mode ~= 51) then return; end
  if not text:lower():find('konchus') then return; end
  CaveBot.setOff()
   tyrBot.storage._configs.cavebot_configs.selected = 'Konchu'
  CaveBot.setOn()

   return true;
end)

onTalk(function(name, level, mode, text, channelId, pos)
if not  profile._storage.autoTaksu.enabled then return end
  if (mode ~= 51) then return; end
  if not text:lower():find('skeleton fears') then return; end
  CaveBot.setOff()
   tyrBot.storage._configs.cavebot_configs.selected = 'Skeletonfears'
  CaveBot.setOn()

   return true;
end)


onTalk(function(name, level, mode, text, channelId, pos)
if not  profile._storage.autoTaksu.enabled then return end
  if (mode ~= 51) then return; end
  if not text:lower():find('devils') then return; end
  CaveBot.setOff()
   tyrBot.storage._configs.cavebot_configs.selected = 'Devils'

   return true;
end)


onTalk(function(name, level, mode, text, channelId, pos)
if not  profile._storage.autoTaksu.enabled then return end
  if (mode ~= 51) then return; end
  if not text:lower():find('akatsukis') then return; end
  CaveBot.gotoLabel('desistir')
end)


onTalk(function(name, level, mode, text, channelId, pos)
if not  profile._storage.autoTaksu.enabled then return end
  if (mode ~= 51) then return; end
  if not text:lower():find('shinobi skyss') then return; end
  CaveBot.setOff()
   tyrBot.storage._configs.cavebot_configs.selected = 'Shinobiskyss'
  CaveBot.setOn()

   return true;
end)


onTalk(function(name, level, mode, text, channelId, pos)
if not  profile._storage.autoTaksu.enabled then return end
  if (mode ~= 51) then return; end
  if not text:lower():find('kimimaros') then return; end
  CaveBot.setOff()
   tyrBot.storage._configs.cavebot_configs.selected = 'Kimimaros'
  CaveBot.setOn()

   return true;
end)



onTalk(function(name, level, mode, text, channelId, pos)
if not  profile._storage.autoTaksu.enabled then return end
  if (mode ~= 51) then return; end
  if not text:lower():find('ultimate skeletons') then return; end
  CaveBot.setOff()
  tyrBot.storage._configs.cavebot_configs.selected = 'Ultimateskeletontaksu'
  CaveBot.setOn()

   return true;
end)





onTalk(function(name, level, mode, text, channelId, pos)
if not  profile._storage.autoTaksu.enabled then return end
  if (mode ~= 51) then return; end
  if not text:lower():find('jiiroubous') then return; end
  CaveBot.setOff()
   tyrBot.storage._configs.cavebot_configs.selected = 'Jiiroubous'
  CaveBot.setOn()

   return true;
end)

onTalk(function(name, level, mode, text, channelId, pos)
if not  profile._storage.autoTaksu.enabled then return end
  if (mode ~= 51) then return; end
  if not text:lower():find('rounins') then return; end
  CaveBot.setOff()
  tyrBot.storage._configs.cavebot_configs.selected = 'Rounintaksu'
  CaveBot.setOn()

   return true;
end)




onTalk(function(name, level, mode, text, channelId, pos)
if not  profile._storage.autoTaksu.enabled then return end
  if (mode ~= 51) then return; end
  if not text:lower():find('dark snakes') then return; end
  CaveBot.setOff()
   tyrBot.storage._configs.cavebot_configs.selected = 'Darksnakes'
  CaveBot.setOn()

   return true;
end)



onTalk(function(name, level, mode, text, channelId, pos)
if not  profile._storage.autoTaksu.enabled then return end
  if (mode ~= 51) then return; end
  if not text:lower():find('gedou skeletons') then return; end
  CaveBot.setOff()
   tyrBot.storage._configs.cavebot_configs.selected = 'Gedouskeletons'

   return true;



end)


onTalk(function(name, level, mode, text, channelId, pos)
if not  profile._storage.autoTaksu.enabled then return end
  if (mode ~= 51) then return; end
  if not text:lower():find('yoth furies') then return; end
  CaveBot.setOff()
   tyrBot.storage._configs.cavebot_configs.selected = 'Yothfuries'
  CaveBot.setOn()

   return true;
end)

onTalk(function(name, level, mode, text, channelId, pos)
if not  profile._storage.autoTaksu.enabled then return end
  if (mode ~= 51) then return; end
  if not text:lower():find('konchu dokus') then return; end
  CaveBot.setOff()
   tyrBot.storage._configs.cavebot_configs.selected = 'Konchudokutaksu'
  CaveBot.setOn()
   return true;
end)

onTalk(function(name, level, mode, text, channelId, pos)
if not  profile._storage.autoTaksu.enabled then return end
  if (mode ~= 51) then return; end
  if not text:lower():find('ishikawas') then return; end
  CaveBot.setOff()
   tyrBot.storage._configs.cavebot_configs.selected = 'Ishkawataksu'
  CaveBot.setOn()

   return true;
end)


onTalk(function(name, level, mode, text, channelId, pos)
if not  profile._storage.autoTaksu.enabled then return end
  if (mode ~= 51) then return; end
  if not text:lower():find('renegades') then return; end
  CaveBot.setOff()
   tyrBot.storage._configs.cavebot_configs.selected = 'Renegade'
  CaveBot.setOn()

   return true;
end)

onTalk(function(name, level, mode, text, channelId, pos)
if not  profile._storage.autoTaksu.enabled then return end
  if (mode ~= 51) then return; end
  if not text:lower():find('supreme sands') then return; end
  CaveBot.setOff()
   tyrBot.storage._configs.cavebot_configs.selected = 'Supremesands'
  CaveBot.setOn()

   return true;
end)

onTalk(function(name, level, mode, text, channelId, pos)
if not  profile._storage.autoTaksu.enabled then return end
  if (mode ~= 51) then return; end
  if not text:lower():find('black deaths') then return; end
  CaveBot.setOff()
   tyrBot.storage._configs.cavebot_configs.selected = 'blackDeathZoltan'
  CaveBot.setOn()

   return true;
end)


onTalk(function(name, level, mode, text, channelId, pos)
if not  profile._storage.autoTaksu.enabled then return end
  if (mode ~= 51) then return; end
  if not text:lower():find('tsuyoi kyojins') then return; end
  CaveBot.setOff()
   tyrBot.storage._configs.cavebot_configs.selected = 'Tsuyoikyojintaksu'
  CaveBot.setOn()

   return true;
end)

onTalk(function(name, level, mode, text, channelId, pos)
if not  profile._storage.autoTaksu.enabled then return end
  if (mode ~= 51) then return; end
  if not text:lower():find('kikkais') then return; end
  CaveBot.setOff()
   tyrBot.storage._configs.cavebot_configs.selected = 'Kikkaitaksu'
  CaveBot.setOn()

   return true;
end)


onTalk(function(name, level, mode, text, channelId, pos)
if not  profile._storage.autoTaksu.enabled then return end
  if (mode ~= 51) then return; end
  if not text:lower():find('venom scorpions') then return; end
  CaveBot.setOff()
   tyrBot.storage._configs.cavebot_configs.selected = 'Venomscorpiontaksu'
  CaveBot.setOn()


   return true;
end)


onTalk(function(name, level, mode, text, channelId, pos)
if not  profile._storage.autoTaksu.enabled then return end
  if (mode ~= 51) then return; end
  if not text:lower():find('araks') then return; end
  CaveBot.setOff()
   tyrBot.storage._configs.cavebot_configs.selected = 'Araktaksu'
  CaveBot.setOn()

   return true;
end)

onTalk(function(name, level, mode, text, channelId, pos)
if not  profile._storage.autoTaksu.enabled then return end
  if (mode ~= 51) then return; end
  if not text:lower():find('scorpions') then return; end
  CaveBot.setOff()
   tyrBot.storage._configs.cavebot_configs.selected = 'Scorpiontaksu'
  CaveBot.setOn()

   return true;
end)

onTalk(function(name, level, mode, text, channelId, pos)
if not  profile._storage.autoTaksu.enabled then return end
  if (mode ~= 51) then return; end
  if not text:lower():find('aracnideos') then return; end
  CaveBot.setOff()
   tyrBot.storage._configs.cavebot_configs.selected = 'Araktaksu'
  CaveBot.setOn()

   return true;
end)

onTalk(function(name, level, mode, text, channelId, pos)
if not  profile._storage.autoTaksu.enabled then return end
  if (mode ~= 51) then return; end
  if not text:lower():find('wamus. termine') then return; end
  CaveBot.setOff()
   tyrBot.storage._configs.cavebot_configs.selected = 'Wamutaksu'
  CaveBot.setOn()

   return true;
end)

onTalk(function(name, level, mode, text, channelId, pos)
if not  profile._storage.autoTaksu.enabled then return end
  if (mode ~= 51) then return; end
  if not text:find('%d+ Dai Wamus') then return; end
  CaveBot.setOff()
  storage._configs.cavebot_configs.selected = 'Daiwamutaksu'
  CaveBot.setOn()


   return true;
end)



onTalk(function(name, level, mode, text, channelId, pos)
if not  profile._storage.autoTaksu.enabled then return end
  if (mode ~= 51) then return; end
  if not text:lower():find('vampires') then return; end
  CaveBot.setOff()
   tyrBot.storage._configs.cavebot_configs.selected = 'Vampiretaksu'
  CaveBot.setOn()

   return true;
end)

onTalk(function(name, level, mode, text, channelId, pos)
if not  profile._storage.autoTaksu.enabled then return end
  if (mode ~= 51) then return; end
  if not text:lower():find('vampire mutateds') then return; end
  CaveBot.setOff()
   tyrBot.storage._configs.cavebot_configs.selected = 'Vampiramutatedtaksu'
  CaveBot.setOn()

   return true;
end)


onTalk(function(name, level, mode, text, channelId, pos)
if not  profile._storage.autoTaksu.enabled then return end
  if (mode ~= 51) then return; end
  if not text:lower():find('ibukis') then return; end
  CaveBot.setOff()
   tyrBot.storage._configs.cavebot_configs.selected = 'Ibukitaksu'
  CaveBot.setOn()

   return true;
end)

onTalk(function(name, level, mode, text, channelId, pos)
if not  profile._storage.autoTaksu.enabled then return end
  if (mode ~= 51) then return; end
  if not text:lower():find('hebi shiros') then return; end
  CaveBot.setOff()
   tyrBot.storage._configs.cavebot_configs.selected = 'Hebishirotaksu'
  CaveBot.setOn()

   return true;
end)




-----------------------------------------------------------






onTextMessage(function(mode, text)
if not profile._storage.autoTask.enabled then return end
  if not text:lower():find('criatura akaname') then return; end
            CaveBot.setOff()
             tyrBot.storage._configs.cavebot_configs.selected = 'Akamanezoltan'
            CaveBot.setOn()
end)


onTextMessage(function(mode, text)
if not profile._storage.autoTask.enabled then return end
  if not text:lower():find('criatura akamanto') then return; end
            CaveBot.setOff()
             tyrBot.storage._configs.cavebot_configs.selected = 'Akamantozoltan'
            CaveBot.setOn()
end)


onTextMessage(function(mode, text)
if not profile._storage.autoTask.enabled then return end
  if not text:lower():find('criatura araken') then return; end
            CaveBot.setOff()
             tyrBot.storage._configs.cavebot_configs.selected = 'Arakzoltan'
            CaveBot.setOn()
end)


onTextMessage(function(mode, text)
if not profile._storage.autoTask.enabled then return end
  if not text:lower():find('criatura arak') then return; end
            CaveBot.setOff()
             tyrBot.storage._configs.cavebot_configs.selected = 'Arakzoltan'
            CaveBot.setOn()
end)


onTextMessage(function(mode, text)
if not profile._storage.autoTask.enabled then return end
  if not text:lower():find('criatura bikkubado') then return; end
            CaveBot.setOff()
             tyrBot.storage._configs.cavebot_configs.selected = 'Bikkubadozoltan'
            CaveBot.setOn()
end)

onTextMessage(function(mode, text)
if not profile._storage.autoTask.enabled then return end
  if not text:lower():find('criatura hebi shiro') then return; end
            CaveBot.setOff()
             tyrBot.storage._configs.cavebot_configs.selected = 'Hebishirozoltan'
            CaveBot.setOn()
end)

onTextMessage(function(mode, text)
if not profile._storage.autoTask.enabled then return end
  if not text:lower():find('criatura heishi') then return; end
            CaveBot.setOff()
             tyrBot.storage._configs.cavebot_configs.selected = 'Heishizoltan'
            CaveBot.setOn()
end)


onTextMessage(function(mode, text)
if not profile._storage.autoTask.enabled then return end
  if not text:lower():find('criatura ibuki') then return; end
            CaveBot.setOff()
             tyrBot.storage._configs.cavebot_configs.selected = 'Ibukizoltan'
            CaveBot.setOn()
end)


onTextMessage(function(mode, text)
if not profile._storage.autoTask.enabled then return end
  if not text:lower():find('criatura iranki') then return; end
            CaveBot.setOff()
             tyrBot.storage._configs.cavebot_configs.selected = 'Irankizoltan'
            CaveBot.setOn()
end)

onTextMessage(function(mode, text)
if not profile._storage.autoTask.enabled then return end
  if not text:lower():find('criatura jaakuna tako') then return; end
            CaveBot.setOff()
            tyrBot.storage._configs.cavebot_configs.selected = 'Jaakunatakozoltan'
            CaveBot.setOn()
end)


onTextMessage(function(mode, text)
if not profile._storage.autoTask.enabled then return end
  if not text:lower():find('criatura keshin') then return; end
            CaveBot.setOff()
             tyrBot.storage._configs.cavebot_configs.selected = 'Keshinzoltan'
            CaveBot.setOn()
end)


onTextMessage(function(mode, text)
if not profile._storage.autoTask.enabled then return end
  if not text:lower():find('criatura mamushi') then return; end
            CaveBot.setOff()
             tyrBot.storage._configs.cavebot_configs.selected = 'Mamushizoltan'
            CaveBot.setOn()
end)

onTextMessage(function(mode, text)
if not profile._storage.autoTask.enabled then return end
  if not text:lower():find('criatura miratsu') then return; end
            CaveBot.setOff()
             tyrBot.storage._configs.cavebot_configs.selected = 'Miratsuzoltan'
            CaveBot.setOn()
end)


onTextMessage(function(mode, text)
if not profile._storage.autoTask.enabled then return end
  if not text:lower():find('criatura ribaiasan') then return; end
            CaveBot.setOff()
            tyrBot.storage._configs.cavebot_configs.selected = 'Ribaiasanzoltan'
            CaveBot.setOn()
end)


onTextMessage(function(mode, text)
if not profile._storage.autoTask.enabled then return end
  if not text:lower():find('criatura scorpion') then return; end
            CaveBot.setOff()
             tyrBot.storage._configs.cavebot_configs.selected = 'Scorpionzoltan'
            CaveBot.setOn()
end)


onTextMessage(function(mode, text)
if not profile._storage.autoTask.enabled then return end
  if not text:lower():find('criatura senchou') then return; end
            CaveBot.setOff()
             tyrBot.storage._configs.cavebot_configs.selected = 'Senchouzoltan'
            CaveBot.setOn()
end)


onTextMessage(function(mode, text)
  if not text:lower():find('voce ja realizou as tarefas de hoje de monstros') then return; end
            CaveBot.setOff()

end)


onTextMessage(function(mode, text)
if not profile._storage.autoTask.enabled then return end
  if not text:lower():find('criatura supreme sand') then return; end
            CaveBot.setOff()
             tyrBot.storage._configs.cavebot_configs.selected = 'Supremesandzoltan'
            CaveBot.setOn()
end)

onTextMessage(function(mode, text)
if not profile._storage.autoTask.enabled then return end
  if not text:lower():find('criatura tsuyoi kyojin') then return; end
            CaveBot.setOff()
             tyrBot.storage._configs.cavebot_configs.selected = 'Tsuyoikyojinzoltan'
            CaveBot.setOn()
end)

onTextMessage(function(mode, text)
if not profile._storage.autoTask.enabled then return end
  if not text:lower():find('criatura ultimate skeleton') then return; end
            CaveBot.setOff()
             tyrBot.storage._configs.cavebot_configs.selected = 'Ultimateskeletonzoltan'
            CaveBot.setOn()
end)



onTextMessage(function(mode, text)
if not profile._storage.autoTask.enabled then return end
  if not text:lower():find('criatura vampire') then return; end
            CaveBot.setOff()
             tyrBot.storage._configs.cavebot_configs.selected = 'Vampirezoltan'
            CaveBot.setOn()
end)


onTextMessage(function(mode, text)
if not profile._storage.autoTask.enabled then return end
  if not text:lower():find('criatura vampire mutated') then return; end
            CaveBot.setOff()
             tyrBot.storage._configs.cavebot_configs.selected = 'Vampiremutedzoltan'
            CaveBot.setOn()
end)

onTextMessage(function(mode, text)
if not profile._storage.autoTask.enabled then return end
  if not text:lower():find('criatura wamu') then return; end
            CaveBot.setOff()
             tyrBot.storage._configs.cavebot_configs.selected = 'Wamuzoltan'
            CaveBot.setOn()
end)


onTextMessage(function(mode, text)
if not profile._storage.autoTask.enabled then return end
  if not text:lower():find('criatura zyhan') then return; end
            CaveBot.setOff()
             tyrBot.storage._configs.cavebot_configs.selected = 'Zyhanzoltan'
            CaveBot.setOn()
end)







-----------------------------------------------



onTalk(function(name, level, mode, text, channelId, pos)
  if (mode ~= 51) then return; end
  if not text:lower():find('apenas para quem completa uma task') then return; end
      CaveBot.gotoLabel('byenpc')
end)


onTalk(function(name, level, mode, text, channelId, pos)
  if (mode ~= 51) then return; end
  if not profile._storage.autoTaksu.enabled then return end
  if not text:lower():find('pode fazer tasks por pontos a cada 6 horas') then return; end
  contagem = contagem + 1
  CaveBot.setOff()
   tyrBot.storage._configs.cavebot_configs.selected = 'Zoltan'
  CaveBot.setOn()
   return true;
end)

onTalk(function(name, level, mode, text, channelId, pos)
  if (mode ~= 51) then return; end
    if not profile._storage.autoTaksu.enabled then return end
  if not text:lower():find('voce esta com uma task ativada') then return; end
      CaveBot.gotoLabel('ir')
end)




onTalk(function(name, level, mode, text, channelId, pos)
  if (mode ~= 51) then return; end
  if not text:lower():find('desistiu de sua ultima task') then return; end
  contagem = contagem + 1
   return true;
end)


onTalk(function(name, level, mode, text, channelId, pos)
  if (mode ~= 51) then return; end
  if not text:lower():find('apenas premium account') then return; end
  CaveBot.setOff()
   return true;
end)



onTalk(function(name, level, mode, text, channelId, pos)
  if (mode ~= 51) then return; end
  if not text:lower():find('pode realizar apenas 3 tasks') then return; end
 contagem = contagem + 1
 CaveBot.setOff()
       tyrBot.storage._configs.cavebot_configs.selected = 'Zoltan'
	   CaveBot.setOn()
   return true;
end)


-------------





-------


onTalk(function(name, level, mode, text, channelId, pos)
  if mode ~= 51 then return end  -- Verifica o modo da mensagem
  if not profile._storage.autoTask.enabled then return end

  -- Procura pela frase espec�fica com horas, minutos e segundos
  if not (text:lower():find('deve esperar um intervalo de %d+ horas, %d+ minutos e %d+ segundos') or
          text:lower():find('deve esperar um intervalo de %d+ minutos e %d+ segundos') or
          text:lower():find('deve esperar um intervalo de %d+ segundos')) then
      return
  end

  -- Captura horas, minutos e segundos da string, podendo estar ausentes
  local hours, minutes, seconds = text:lower():match("(%d+) horas, (%d+) minutos e (%d+) segundos")
  if not hours and not minutes then
    minutes, seconds = text:lower():match("(%d+) minutos e (%d+) segundos")
  end
  if not minutes and not seconds then
    seconds = text:lower():match("(%d+) segundos")
  end

  -- Inicializa valores como 0 se n�o forem encontrados
  hours = tonumber(hours) or 0
  minutes = tonumber(minutes) or 0
  seconds = tonumber(seconds) or 0

  -- Verifica se pelo menos um valor foi capturado corretamente
  if hours >= 0 and minutes >= 0 and seconds >= 0 then
    -- Converte o tempo total para segundos
    local totalTime = (hours * 3600) + (minutes * 60) + seconds

    -- Atualiza o timer com base no tempo capturado
    storage.endTime3 = os.time() + totalTime

    -- Ativa o timer
    tmrMacro3:setOn()
  end

  -- Controle da l�gica do CaveBot
  contagem = contagem + 2  -- Incrementa a vari�vel contagem

  if profile._storage.autoChouji.enabled then
    CaveBot.setOff()
    delay(1500)  -- Aguarda 1,5 segundos
     tyrBot.storage._configs.cavebot_configs.selected = 'Voltarzoltan'  -- Altera a configura��o do CaveBot
    CaveBot.setOn()
  elseif contagem >= 3 then  -- Caso o valor da contagem seja 3 ou maior
    CaveBot.setOff()
     tyrBot.storage._configs.cavebot_configs.selected = 'treinarZoltan'  -- Altera a configura��o para treinar
    CaveBot.setOn()
    contagem = 0  -- Reseta a vari�vel contagem
  end
end)



onTalk(function(name, level, mode, text, channelId, pos)
  if (mode ~= 51) then return; end
  if not text:lower():find('voce ja realizou as tarefas de hoje de monstros') then return; end
  contagem = contagem + 1
   CaveBot.setOff()
       tyrBot.storage._configs.cavebot_configs.selected = 'Zoltan'
	   CaveBot.setOn()
end)

  onTalk(function(name, level, mode, text, channelId, pos)
  if not isAutoChoujiEnabled() then return end
    if mode ~= 51 then return end
    if not text:lower():find('no momento voc� ja realizou 3 de ca�ar monstros no dia de hoje') then return end
	 contagem = contagem + 1
	 if profile._storage.autoTaksu.enabled then
   CaveBot.setOff()
       tyrBot.storage._configs.cavebot_configs.selected = 'checknpc'
	   CaveBot.setOn()
	   elseif profile._storage.autoTask.enabled then
	   CaveBot.setOff()
       tyrBot.storage._configs.cavebot_configs.selected = 'Zoltan'
	   CaveBot.setOn() 
	   else   
	   CaveBot.setOff()
       tyrBot.storage._configs.cavebot_configs.selected = 'ficarAFK'
	   CaveBot.setOn()  end


  end)




onTextMessage(function(mode, text)
  if not text:lower():find('finalizou sua task') then return; end
      CaveBot.gotoLabel('entregar')
end)


onTextMessage(function(mode, text)
  if not text:lower():find('voc� terminou a task do evento de resistencia') then return; end
      CaveBot.gotoLabel('entregar')
end)

onTextMessage(function(mode, text)
if not profile._storage.autoTask.enabled then return end
  if not text:lower():find('tempo da sua task fama terminou') then return; end
      CaveBot.gotoLabel('entregar')
end)


onTalk(function(name, level, mode, text, channelId, pos)
  if (mode ~= 51) then return; end
  if not text:lower():find('voce nao tem os 20 gold bar') then return; end
  CaveBot.setOff()
   return true;
end)

onTalk(function(name, level, mode, text, channelId, pos)
  if (mode ~= 51) then return; end
  if not text:lower():find('voce nao tem os 10 gold bar') then return; end
  CaveBot.setOff()
   return true;
end)

------------------