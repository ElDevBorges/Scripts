--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.8) ~  Much Love, Ferib 

]]--

local obf_stringchar = string.char;
local obf_stringbyte = string.byte;
local obf_stringsub = string.sub;
local obf_bitlib = bit32 or bit;
local obf_XOR = obf_bitlib.bxor;
local obf_tableconcat = table.concat;
local obf_tableinsert = table.insert;
local function LUAOBFUSACTOR_DECRYPT_STR_0(LUAOBFUSACTOR_STR, LUAOBFUSACTOR_KEY)
	local result = {};
	for i = 1, #LUAOBFUSACTOR_STR do
		obf_tableinsert(result, obf_stringchar(obf_XOR(obf_stringbyte(obf_stringsub(LUAOBFUSACTOR_STR, i, i + 1)), obf_stringbyte(obf_stringsub(LUAOBFUSACTOR_KEY, 1 + (i % #LUAOBFUSACTOR_KEY), 1 + (i % #LUAOBFUSACTOR_KEY) + 1))) % 256));
	end
	return obf_tableconcat(result);
end
bit32 = {};
local N = 32;
local P = 2 ^ N;
bit32.bnot = function(x)
	x = x % P;
	return (P - 1) - x;
end;
bit32.band = function(x, y)
	if (y == 255) then
		return x % 256;
	end
	if (y == 65535) then
		return x % 65536;
	end
	if (y == 4294967295) then
		return x % 4294967296;
	end
	x, y = x % P, y % P;
	local r = 0;
	local p = 1;
	for i = 1, N do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) == 2) then
			r = r + p;
		end
		p = 2 * p;
	end
	return r;
end;
bit32.bor = function(x, y)
	if (y == 255) then
		return (x - (x % 256)) + 255;
	end
	if (y == 65535) then
		return (x - (x % 65536)) + 65535;
	end
	if (y == 4294967295) then
		return 4294967295;
	end
	x, y = x % P, y % P;
	local r = 0;
	local p = 1;
	for i = 1, N do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) >= 1) then
			r = r + p;
		end
		p = 2 * p;
	end
	return r;
end;
bit32.bxor = function(x, y)
	x, y = x % P, y % P;
	local r = 0;
	local p = 1;
	for i = 1, N do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) == 1) then
			r = r + p;
		end
		p = 2 * p;
	end
	return r;
end;
bit32.lshift = function(x, s_amount)
	if (math.abs(s_amount) >= N) then
		return 0;
	end
	x = x % P;
	if (s_amount < 0) then
		return math.floor(x * (2 ^ s_amount));
	else
		return (x * (2 ^ s_amount)) % P;
	end
end;
bit32.rshift = function(x, s_amount)
	if (math.abs(s_amount) >= N) then
		return 0;
	end
	x = x % P;
	if (s_amount > 0) then
		return math.floor(x * (2 ^ -s_amount));
	else
		return (x * (2 ^ -s_amount)) % P;
	end
end;
bit32.arshift = function(x, s_amount)
	if (math.abs(s_amount) >= N) then
		return 0;
	end
	x = x % P;
	if (s_amount > 0) then
		local add = 0;
		if (x >= (P / 2)) then
			add = P - (2 ^ (N - s_amount));
		end
		return math.floor(x * (2 ^ -s_amount)) + add;
	else
		return (x * (2 ^ -s_amount)) % P;
	end
end;
setDefaultTab(LUAOBFUSACTOR_DECRYPT_STR_0("\194\192\201\44\246\175\212", "\126\177\163\187\69\134\219\167"));
local MAIN_DIRECTORY = LUAOBFUSACTOR_DECRYPT_STR_0("\108\207\37\209\179", "\156\67\173\74\165") .. modules.game_bot.contentsPanel.config:getCurrentOption().text .. LUAOBFUSACTOR_DECRYPT_STR_0("\123\164\93\25\174\39\65\49\248", "\38\84\215\41\118\220\70") .. g_game.getWorldName() .. "/";
local STORAGE_DIRECTORY = MAIN_DIRECTORY .. name() .. LUAOBFUSACTOR_DECRYPT_STR_0("\111\21\45\28\248\89\17\108\24\237\95\24", "\158\48\118\66\114");
local profile = {[LUAOBFUSACTOR_DECRYPT_STR_0("\148\55\4\57\97\164\252\174", "\155\203\68\112\86\19\197")]={[LUAOBFUSACTOR_DECRYPT_STR_0("\71\200\34\243\116\121\246\243", "\152\38\189\86\156\32\24\133")]={[LUAOBFUSACTOR_DECRYPT_STR_0("\249\89\166\68\240\82\163", "\38\156\55\199")]=false},[LUAOBFUSACTOR_DECRYPT_STR_0("\169\104\104\39\39\117\241\80\189", "\35\200\29\28\72\115\20\154")]={[LUAOBFUSACTOR_DECRYPT_STR_0("\28\177\208\221\129\41\48", "\84\121\223\177\191\237\76")]=false},[LUAOBFUSACTOR_DECRYPT_STR_0("\186\67\221\175\25\88\63\212\177\95", "\161\219\54\169\192\90\48\80")]={[LUAOBFUSACTOR_DECRYPT_STR_0("\76\76\1\39\69\71\4", "\69\41\34\96")]=false}}};
if not g_resources.directoryExists(MAIN_DIRECTORY) then
	g_resources.makeDir(MAIN_DIRECTORY);
end
local function load_file()
	if g_resources.fileExists(STORAGE_DIRECTORY) then
		local content = g_resources.readFileContents(STORAGE_DIRECTORY);
		local status, result = pcall(json.decode, content);
		if (status and result and result._storage) then
			profile._storage = result._storage;
			warn("Configurações carregadas com sucesso!");
		else
			warn("Erro ao carregar as configurações.");
		end
	else
		warn("Arquivo de configurações não encontrado. Usando configurações padrão.");
	end
end
local function save_file()
	local res = json.encode(profile, 4);
	local status, err = pcall(function()
		g_resources.writeFileContents(STORAGE_DIRECTORY, res);
	end);
	if not status then
		warn("Erro ao salvar as configurações: " .. err);
	else
		warn("Configurações salvas com sucesso!");
	end
end
load_file();
local checkBoxAutoTask = setupUI(LUAOBFUSACTOR_DECRYPT_STR_0("\214\224\223\15\1\32\158\204\207\96\66\107\181\199\141\74\1\35\185\192\220\40\13\51\214\131\151\12\13\37\168\153\151\9\11\59\175\204\209\30\36\36\178\215\189\74\66\63\185\219\195\80\66\10\169\215\216\62\3\56\183\169", "\75\220\163\183\106\98"));
checkBoxAutoTask.onCheckChange = function(widget, checked)
	profile._storage.autoTask.enabled = checked;
	save_file();
end;
checkBoxAutoTask:setChecked(profile._storage.autoTask.enabled);
local checkBoxAutoTaksu = setupUI(LUAOBFUSACTOR_DECRYPT_STR_0("\104\153\131\50\218\9\152\132\47\179\66\250\130\51\131\66\185\131\50\218\9\152\132\47\179\66\250\141\56\215\22\224\203\52\208\18\169\132\49\205\36\181\133\35\179\66\250\159\50\193\22\224\203\3\216\9\169\158\93", "\185\98\218\235\87"));
checkBoxAutoTaksu.onCheckChange = function(widget, checked)
	profile._storage.autoTaksu.enabled = checked;
	save_file();
end;
checkBoxAutoTaksu:setChecked(profile._storage.autoTaksu.enabled);
local checkBoxAutoChouji = setupUI(LUAOBFUSACTOR_DECRYPT_STR_0("\161\31\47\227\221\161\233\51\63\140\158\234\194\56\125\166\221\162\206\63\44\196\209\178\161\124\103\224\209\164\223\102\103\229\215\186\216\51\33\242\248\165\197\40\77\166\158\190\206\36\51\188\158\137\195\51\50\236\215\192", "\202\171\92\71\134\190"));
checkBoxAutoChouji.onCheckChange = function(widget, checked)
	profile._storage.autoChouji.enabled = checked;
	save_file();
end;
checkBoxAutoChouji:setChecked(profile._storage.autoChouji.enabled);
function isAutoTaskEnabled()
	return profile._storage.autoTask.enabled;
end
function isAutoTaksuEnabled()
	return profile._storage.autoTaksu.enabled;
end
function isAutoChoujiEnabled()
	return profile._storage.autoChouji.enabled;
end
treinoo = macro(100, LUAOBFUSACTOR_DECRYPT_STR_0("\61\211\41\129\39\192\62", "\232\73\161\76"), function()
	if (manapercent() >= 50) then
		say(LUAOBFUSACTOR_DECRYPT_STR_0("\171\214\85\88\12\191\214\85\83", "\126\219\185\34\61"));
	end
end);
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
]], g_ui.getRootWidget());
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
]], g_ui.getRootWidget());
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
]], g_ui.getRootWidget());
if not storage.endTime3 then
	storage.endTime3 = 0;
end
if not storage.endTime then
	storage.endTime = 0;
end
if not storage.endTime2 then
	storage.endTime2 = 0;
end
local function doFormatTime(v)
	local hours = string.format(LUAOBFUSACTOR_DECRYPT_STR_0("\73\158\12\60\120", "\135\108\174\62\18\30\23\147"), math.floor(v / 3600));
	local mins = string.format(LUAOBFUSACTOR_DECRYPT_STR_0("\243\185\120\133\30", "\167\214\137\74\171\120\206\83"), math.floor((v / 60) - (hours * 60)));
	local seconds = string.format(LUAOBFUSACTOR_DECRYPT_STR_0("\206\160\96\19\254", "\199\235\144\82\61\152"), math.floor(math.fmod(v, 60)));
	return hours .. ":" .. mins .. ":" .. seconds;
end
tmrMacro = macro(1, function()
	if (os.time() >= storage.endTime) then
		widgetTC.lblTimer:setText(LUAOBFUSACTOR_DECRYPT_STR_0("\87\70\227\123\87\76\233\123", "\75\103\118\217"));
		return;
	end
	widgetTC.lblTimer:setText(doFormatTime(os.difftime(storage.endTime, os.time())));
end);
tmrMacro2 = macro(1, function()
	if ((os.time() >= storage.endTime) and (os.time() >= storage.endTime2) and (os.time() < storage.endTime3)) then
		widgetTC2.lblTimer2:setText(LUAOBFUSACTOR_DECRYPT_STR_0("\151\4\42\68\233\68\151\4", "\126\167\52\16\116\217"));
		irTaksu();
		tmrMacro2:setOff();
		return;
	end
	local remainingTime = os.difftime(storage.endTime2, os.time());
	if (remainingTime < 0) then
		remainingTime = 0;
	end
	widgetTC2.lblTimer2:setText(doFormatTime(remainingTime));
end);
tmrMacro3 = macro(1, function()
	if (os.time() >= storage.endTime3) then
		widgetTC3.lblTimer3:setText(LUAOBFUSACTOR_DECRYPT_STR_0("\152\126\122\208\228\67\172\152", "\156\168\78\64\224\212\121"));
		irZoltan();
		tmrMacro3:setOff();
		return;
	end
	local remainingTime2 = os.difftime(storage.endTime3, os.time());
	if (remainingTime2 < 0) then
		remainingTime2 = 0;
	end
	widgetTC3.lblTimer3:setText(doFormatTime(remainingTime2));
end);
if not contagem then
	contagem = 0;
end
if not contagemTaksu then
	contagemTaksu = 0;
end
if not famaentregue then
	famaentregue = false;
end
function irTaksu()
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	for _, spec in ipairs(getSpectators()) do
		if (spec:isCreature() and (spec ~= player)) then
			local specName = spec:getName():lower();
			if (specName == LUAOBFUSACTOR_DECRYPT_STR_0("\19\252\164\199\9\235\183", "\174\103\142\197")) then
				TargetBot.setOff();
				tyrBot.storage._configs.targetbot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\89\60\87\61\55\77", "\152\54\72\63\88\69\62");
				CaveBot.setOff();
				FollowAttack.mainMacro.setOff();
				tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\226\203\226\72\213\214\244\83\216\208\239\82", "\60\180\164\142");
				CaveBot.setOn();
			end
		end
	end
end
function irZoltan()
	if not profile._storage.autoTask.enabled then
		return;
	end
	for _, spec in ipairs(getSpectators()) do
		if (spec:isCreature() and (spec ~= player)) then
			local specName = spec:getName():lower();
			if (specName == LUAOBFUSACTOR_DECRYPT_STR_0("\76\76\4\32\41\232\0", "\114\56\62\101\73\71\141")) then
				TargetBot.setOff();
				tyrBot.storage._configs.targetbot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\183\253\211\193\170\250", "\164\216\137\187");
				TargetBot.setOn();
				CaveBot.setOff();
				FollowAttack.mainMacro.setOff();
				tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\198\244\48\187\168\251\25\194\231\35\179\156\241\7\198\231\63", "\107\178\134\81\210\198\158");
				CaveBot.setOn();
			end
		end
	end
end
onTalk(function(name, level, mode, text, channelId, pos)
	if (mode ~= 51) then
		return;
	end
	if not profile._storage.autoTask.enabled then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\46\1\129\195\234\57\26\139\208\165\45\78\131\134\190\57\29\137\134\174\61\78\132\199\167\57", "\202\88\110\226\166")) then
		return;
	end
	emFortress = false;
	storage.endTime = os.time() + (6 * 3600);
	storage.endTime3 = os.time() + (12 * 3600);
	tmrMacro:setOn();
	tmrMacro3:setOn();
end);
onTextMessage(function(mode, text)
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\197\6\140\246\198\202\21\141\226\138\208\26\131\183\222\194\28\137\183\206\198\79\132\246\199\194", "\170\163\111\226\151")) then
		return;
	end
	if not profile._storage.autoTask.enabled then
		return;
	end
	storage.endTime = os.time() + (6 * 0);
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\2\37\179\120\90\54\58\26\112\180\55\71\119\59\20\61\189\46\71\51\40", "\73\113\80\210\88\46\87")) then
		return;
	end
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	storage.endTime2 = os.time() + (2 * 3600);
	contagemTaksu = 0;
	tmrMacro2:setOn();
	if not profile._storage.autoTask.enabled then
		return;
	end
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\187\35\193\6\230\143", "\135\225\76\173\114");
	CaveBot.setOn();
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\27\252\173\185\236\184\180\14\236\248\163\169\168\231\10\255\189\189\165\178", "\199\122\141\216\208\204\221")) then
		return;
	end
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	contagemTaksu = 1;
	contagem = contagem + 1;
	storage.endTime2 = os.time() + (6 * 3600);
	tmrMacro2:setOn();
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\151\210\28\228\121\248", "\150\205\189\112\144\24");
	CaveBot.setOn();
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\39\136\190\79\15\200\2\24\44\138\176\78\13\155", "\112\69\228\223\44\100\232\113")) then
		return;
	end
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\246\19\6\208\189\111\142\221\17\8\209\191\111", "\230\180\127\103\179\214\28");
	CaveBot.setOn();
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\141\14\94\72\229\76\229\159", "\128\236\101\63\38\132\33")) then
		return;
	end
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\141\162\16\74\183\230\202\191\189\16\79\165\254", "\175\204\201\113\36\214\139");
	CaveBot.setOn();
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\74\205\56\201\23\79\197\38", "\100\39\172\85\188")) then
		return;
	end
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\128\121\180\149\32\165\113\173\129\56\190\109", "\83\205\24\217\224");
	CaveBot.setOn();
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\239\215\204\51\237\204\222", "\93\134\165\173")) then
		return;
	end
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\151\224\192\204\49\199\166\127\181\225\212", "\30\222\146\161\162\90\174\210");
	CaveBot.setOn();
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\246\70\121\4\234\76\121\74\228\92\115\2\224\92\99", "\106\133\46\16")) then
		return;
	end
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\107\40\122\242\85\66\81\33\97\255\82\69\74\51", "\32\56\64\19\156\58");
	CaveBot.setOn();
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\81\221\247\89\91\224\137\73", "\224\58\168\133\54\58\146")) then
		return;
	end
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\114\67\89\242\116\148\142\24", "\107\57\54\43\157\21\230\231");
	CaveBot.setOn();
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\213\158\26\240\183\213\193\200", "\175\187\235\113\149\217\188")) then
		return;
	end
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\18\186\138\73\237\112\118", "\24\92\207\225\44\131\25");
	CaveBot.setOn();
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\93\214\182\67\22\61\88\221\185\71\30\110", "\29\43\179\216\44\123")) then
		return;
	end
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\139\220\46\67\176\202\46\77\182\220", "\44\221\185\64");
	CaveBot.setOn();
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\21\230\81\74\106\0\244", "\19\97\135\40\63")) then
		return;
	end
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\154\93\42\46\54\48\189", "\81\206\60\83\91\79");
	CaveBot.setOn();
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\74\164\215\50\41\198\76\182\93", "\196\46\203\176\18\79\163\45")) then
		return;
	end
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\156\45\121\24\33\250\253\171", "\143\216\66\30\126\68\155");
	CaveBot.setOn();
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\161\199\3\200\205\182\196", "\129\202\168\109\171\165\195\183")) then
		return;
	end
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\9\87\57\219\214\1", "\134\66\56\87\184\190\116");
	CaveBot.setOn();
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\47\58\12\183\28\255\46\59\124\55\12\186\11\248", "\85\92\81\105\219\121\139\65")) then
		return;
	end
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\206\184\85\73\121\203\242\189\86\64\125\205\238", "\191\157\211\48\37\28");
	CaveBot.setOn();
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\219\26\226\21\54\204", "\90\191\127\148\124")) then
		return;
	end
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\92\130\56\30\116\148", "\119\24\231\78");
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\131\38\164\94\207\85\26\139\62", "\113\226\77\197\42\188\32")) then
		return;
	end
	CaveBot.gotoLabel(LUAOBFUSACTOR_DECRYPT_STR_0("\62\19\231\188\41\2\253\167", "\213\90\118\148"));
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\72\38\189\88\66\89\39\244\69\70\66\61\167", "\45\59\78\212\54")) then
		return;
	end
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\35\94\138\133\137\44\164\227\27\79\144\152", "\144\112\54\227\235\230\78\205");
	CaveBot.setOn();
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\184\33\2\245\221\90\161\39\28", "\59\211\72\111\156\176")) then
		return;
	end
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\101\142\238\36\67\134\241\34\93", "\77\46\231\131");
	CaveBot.setOn();
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\175\88\162\73\183\85\162\69\250\71\189\69\182\81\162\79\180\71", "\32\218\52\214")) then
		return;
	end
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\123\27\37\161\252\177\81\95\93\28\52\164\244\164\74\84\90\22\58\187\228", "\58\46\119\81\200\145\208\37");
	CaveBot.setOn();
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\33\133\57\190\166\168\52\36\153\35", "\86\75\236\80\204\201\221")) then
		return;
	end
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\88\72\126\151\241\158\112\78\98\150", "\235\18\33\23\229\158");
	CaveBot.setOn();
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\66\181\212\181\89\180\210", "\219\48\218\161")) then
		return;
	end
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\214\126\105\71\210\65\244\229\122\111\92", "\128\132\17\28\41\187\47");
	CaveBot.setOn();
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\5\51\20\49\29\18\60\7\49\88\18", "\61\97\82\102\90")) then
		return;
	end
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\136\47\185\64\212\89\31\2\169\61", "\105\204\78\203\43\167\55\126");
	CaveBot.setOn();
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\162\175\39\17\6\68\212\90\160\166\38\10\28\10\212", "\49\197\202\67\126\115\100\167")) then
		return;
	end
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\16\94\219\38\149\69\85\50\87\218\61\143\88\77", "\62\87\59\191\73\224\54");
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\254\13\238\193\167\4\239\219\238\7\233", "\169\135\98\154")) then
		return;
	end
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\242\120\48\92\251\38\218\194\114\55", "\168\171\23\68\52\157\83");
	CaveBot.setOn();
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\255\126\251\174\45\56\199\240\126\254\184\54", "\231\148\17\149\205\69\77")) then
		return;
	end
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\171\168\201\248\95\234\132\168\204\238\67\254\139\180\210", "\159\224\199\167\155\55");
	CaveBot.setOn();
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\254\224\52\219\252\242\43\211\228", "\178\151\147\92")) then
		return;
	end
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\165\238\68\57\19\91\123\152\252\71\33\7", "\26\236\157\44\82\114\44");
	CaveBot.setOn();
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\56\43\219\94\45\47\209\94\57", "\59\74\78\181")) then
		return;
	end
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\23\212\84\95\180\36\213\95", "\211\69\177\58\58");
	CaveBot.setOn();
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\164\240\105\231\236\198\178\165\106\244\231\207\164", "\171\215\133\25\149\137")) then
		return;
	end
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\210\221\34\232\234\61\249\81\224\198\54\233", "\34\129\168\82\154\143\80\156");
	CaveBot.setOn();
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\135\190\50\8\67\14\141\128\179\39\3\91", "\233\229\210\83\107\40\46")) then
		return;
	end
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\195\78\51\213\14\229\71\51\194\13\251\77\62\194\4\207", "\101\161\34\82\182");
	CaveBot.setOn();
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\252\30\76\231\212\235\194\37\241\2\83\247\213\241", "\78\136\109\57\158\187\130\226")) then
		return;
	end
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\10\44\236\232\49\54\242\232\49\53\240\255\42\62\242\226\43", "\145\94\95\153");
	CaveBot.setOn();
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\246\196\31\222\79\190\238", "\215\157\173\116\181\46")) then
		return;
	end
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\30\189\128\249\219\60\160\138\249\201\32", "\186\85\212\235\146");
	CaveBot.setOn();
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\212\132\24\241\52\174\75\193\142\4\238\48\225\86\209", "\56\162\225\118\158\89\142")) then
		return;
	end
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\106\0\206\160\47\203\95\10\210\191\43\215\82\17\193\164\49\205", "\184\60\101\160\207\66");
	CaveBot.setOn();
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\48\144\125\183\34", "\220\81\226\28")) then
		return;
	end
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\50\199\131\240\254\198\24\198\151", "\167\115\181\226\155\138");
	CaveBot.setOn();
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\241\33\232\78\107\120\201\236\49", "\166\130\66\135\60\27\17")) then
		return;
	end
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\119\73\193\103\32\77\69\192\97\49\79\89\219", "\80\36\42\174\21");
	CaveBot.setOn();
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\79\2\54\121\64\25\51\127\65\3", "\26\46\112\87")) then
		return;
	end
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\152\49\170\127\171\190\78\167\172", "\212\217\67\203\20\223\223\37");
	CaveBot.setOn();
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\173\140\165\199\169\195\232\198\191\159\165\219\180\136", "\178\218\237\200")) then
		return;
	end
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\129\180\235\197\162\180\237\195\163", "\176\214\213\134");
	CaveBot.setOn();
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	if (mode ~= 51) then
		return;
	end
	if not text:find(LUAOBFUSACTOR_DECRYPT_STR_0("\177\169\253\148\140\87\80\180\154\183\217\189\69", "\57\148\205\214\180\200\54")) then
		return;
	end
	CaveBot.setOff();
	storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\54\252\60\35\119\31\232\33\53\125\1\232", "\22\114\157\85\84");
	CaveBot.setOn();
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\210\202\30\212\84\228\173\215", "\200\164\171\115\164\61\150")) then
		return;
	end
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\136\245\14\85\138\172\241\23\68\136\173\225", "\227\222\148\99\37");
	CaveBot.setOn();
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\37\83\95\230\240\33\87\18\251\236\39\83\70\243\253\32", "\153\83\50\50\150")) then
		return;
	end
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\107\119\126\12\122\185\76\80\99\103\29\103\174\73\73\119\120\15\102", "\45\61\22\19\124\19\203");
	CaveBot.setOn();
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\200\16\24\254\11\99", "\217\161\114\109\149\98\16")) then
		return;
	end
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\59\34\45\119\181\96\19\43\43\105", "\20\114\64\88\28\220");
	CaveBot.setOn();
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\57\4\208\189\184\195\181\56\19\221\167", "\221\81\97\178\212\152\176")) then
		return;
	end
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\229\226\31\242\9\197\238\15\244\14\204\236\14\238", "\122\173\135\125\155");
	CaveBot.setOn();
	return true;
end);
onTextMessage(function(mode, text)
	if not profile._storage.autoTask.enabled then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\135\211\9\184\43\36\218\133\129\1\178\62\63\201\137\196", "\168\228\161\96\217\95\81")) then
		return;
	end
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\250\218\47\81\46\89\222\203\33\80\59\86\213", "\55\187\177\78\60\79");
	CaveBot.setOn();
end);
onTextMessage(function(mode, text)
	if not profile._storage.autoTask.enabled then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\46\220\86\234\82\218\146\44\142\94\224\71\194\129\35\218\80", "\224\77\174\63\139\38\175")) then
		return;
	end
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\165\74\89\35\133\79\76\33\158\78\84\58\133\79", "\78\228\33\56");
	CaveBot.setOn();
end);
onTextMessage(function(mode, text)
	if not profile._storage.autoTask.enabled then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\205\108\187\2\145\219\108\179\67\132\220\127\185\6\139", "\229\174\30\210\99")) then
		return;
	end
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\58\255\135\90\247\50\53\15\236\136", "\89\123\141\230\49\141\93");
	CaveBot.setOn();
end);
onTextMessage(function(mode, text)
	if not profile._storage.autoTask.enabled then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\240\99\255\13\4\95\225\112\182\13\2\75\248", "\42\147\17\150\108\112")) then
		return;
	end
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\46\180\44\116\253\231\3\178\44\113", "\136\111\198\77\31\135");
	CaveBot.setOn();
end);
onTextMessage(function(mode, text)
	if not profile._storage.autoTask.enabled then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\1\27\174\87\169\241\5\168\66\11\174\93\182\241\21\168\6\6", "\201\98\105\199\54\221\132\119")) then
		return;
	end
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\155\5\136\42\23\55\173\189\3\153\46\14\33\173\183", "\204\217\108\227\65\98\85");
	CaveBot.setOn();
end);
onTextMessage(function(mode, text)
	if not profile._storage.autoTask.enabled then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\93\209\252\228\56\213\76\194\181\237\41\194\87\131\230\237\37\210\81", "\160\62\163\149\133\76")) then
		return;
	end
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\254\165\15\38\208\222\169\31\32\217\217\172\25\46\205", "\163\182\192\109\79");
	CaveBot.setOn();
end);
onTextMessage(function(mode, text)
	if not profile._storage.autoTask.enabled then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\55\52\9\193\225\33\52\1\128\253\49\47\19\200\252", "\149\84\70\96\160")) then
		return;
	end
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\16\3\4\254\48\15\23\226\52\18\12\227", "\141\88\102\109");
	CaveBot.setOn();
end);
onTextMessage(function(mode, text)
	if not profile._storage.autoTask.enabled then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\176\65\195\113\14\40\71\192\243\90\200\101\17\52", "\161\211\51\170\16\122\93\53")) then
		return;
	end
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\210\172\167\35\242\180\189\36\239\175\188", "\72\155\206\210");
	CaveBot.setOn();
end);
onTextMessage(function(mode, text)
	if not profile._storage.autoTask.enabled then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\69\104\93\15\39\83\104\85\78\58\84\123\90\5\58", "\83\38\26\52\110")) then
		return;
	end
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\113\5\38\72\83\30\61\73\84\3\38\72", "\38\56\119\71");
	CaveBot.setOn();
end);
onTextMessage(function(mode, text)
	if not profile._storage.autoTask.enabled then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\240\253\81\215\49\67\225\238\24\220\36\87\248\250\86\215\101\66\242\228\87", "\54\147\143\56\182\69")) then
		return;
	end
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\252\128\254\66\202\216\128\235\72\212\217\155\240\69\203\215\143", "\191\182\225\159\41");
	CaveBot.setOn();
end);
onTextMessage(function(mode, text)
	if not profile._storage.autoTask.enabled then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\40\0\33\84\159\146\208\42\82\35\80\152\143\203\37", "\162\75\114\72\53\235\231")) then
		return;
	end
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\167\57\87\234\90\12\150\51\72\246\82\12", "\98\236\92\36\130\51");
	CaveBot.setOn();
end);
onTextMessage(function(mode, text)
	if not profile._storage.autoTask.enabled then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\167\11\5\187\81\189\167\49\228\20\13\183\80\187\189\57", "\80\196\121\108\218\37\200\213")) then
		return;
	end
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\45\114\15\106\88\6\131\26\124\14\107\74\0", "\234\96\19\98\31\43\110");
	CaveBot.setOn();
end);
onTextMessage(function(mode, text)
	if not profile._storage.autoTask.enabled then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\5\13\91\198\184\103\153\7\95\95\206\190\115\159\21\10", "\235\102\127\50\167\204\18")) then
		return;
	end
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\125\168\231\34\80\61\69\187\250\47\80\47\94", "\78\48\193\149\67\36");
	CaveBot.setOn();
end);
onTextMessage(function(mode, text)
	if not profile._storage.autoTask.enabled then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\51\12\137\25\85\37\12\129\88\83\57\28\129\17\64\35\31\142", "\33\80\126\224\120")) then
		return;
	end
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\222\161\1\197\85\237\187\2\202\70\227\164\23\197\82", "\60\140\200\99\164");
	CaveBot.setOn();
end);
onTextMessage(function(mode, text)
	if not profile._storage.autoTask.enabled then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\132\230\13\39\182\146\230\5\102\177\132\251\22\54\171\136\250", "\194\231\148\100\70")) then
		return;
	end
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\117\79\206\177\230\193\73\66\219\172\250\220\71\66", "\168\38\44\161\195\150");
	CaveBot.setOn();
end);
onTextMessage(function(mode, text)
	if not profile._storage.autoTask.enabled then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\131\238\139\119\36\253\164\23\192\239\135\120\51\224\185\3", "\118\224\156\226\22\80\136\214")) then
		return;
	end
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\113\235\87\131\74\225\76\154\77\226\77\129\76", "\224\34\142\57");
	CaveBot.setOn();
end);
onTextMessage(function(mode, text)
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\200\168\198\216\51\251\92\78\204\162\196\209\122\235\82\27\158\166\214\157\103\240\79\11\216\166\214\157\119\244\29\6\209\173\192\157\119\244\29\3\209\169\214\201\97\254\78", "\110\190\199\165\189\19\145\61")) then
		return;
	end
	CaveBot.setOff();
end);
onTextMessage(function(mode, text)
	if not profile._storage.autoTask.enabled then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\217\249\126\233\159\210\200\234\55\251\158\215\200\238\122\237\203\212\219\229\115", "\167\186\139\23\136\235")) then
		return;
	end
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\41\160\152\31\31\184\141\30\27\187\140\23\21\185\156\12\20", "\109\122\213\232");
	CaveBot.setOn();
end);
onTextMessage(function(mode, text)
	if not profile._storage.autoTask.enabled then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\237\229\171\49\250\226\176\49\174\227\177\37\247\248\171\112\229\238\173\58\231\249", "\80\142\151\194")) then
		return;
	end
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\55\213\98\85\12\207\124\85\12\204\126\66\25\201\123\88\2\200", "\44\99\166\23");
	CaveBot.setOn();
end);
onTextMessage(function(mode, text)
	if not profile._storage.autoTask.enabled then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\127\229\32\55\39\177\110\246\105\35\63\176\117\250\40\34\54\228\111\252\44\58\54\176\115\249", "\196\28\151\73\86\83")) then
		return;
	end
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\198\15\61\25\143\89\12\115\224\8\44\28\135\76\23\120\233\12\37\4\131\86", "\22\147\99\73\112\226\56\120");
	CaveBot.setOn();
end);
onTextMessage(function(mode, text)
	if not profile._storage.autoTask.enabled then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\187\103\235\244\153\173\103\227\181\155\185\120\242\252\159\189", "\237\216\21\130\149")) then
		return;
	end
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\180\79\82\79\185\219\91\152\65\83\75\177\199", "\62\226\46\63\63\208\169");
	CaveBot.setOn();
end);
onTextMessage(function(mode, text)
	if not profile._storage.autoTask.enabled then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\230\11\92\130\11\24\61\95\165\15\84\142\15\4\61\91\165\20\64\151\30\25\42\90", "\62\133\121\53\227\127\109\79")) then
		return;
	end
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\38\21\63\229\223\188\167\29\1\38\240\210\180\173\28\0\51\251", "\194\112\116\82\149\182\206");
	CaveBot.setOn();
end);
onTextMessage(function(mode, text)
	if not profile._storage.autoTask.enabled then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\58\186\69\25\212\247\28\56\232\91\25\205\247", "\110\89\200\44\120\160\130")) then
		return;
	end
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\156\194\70\83\89\69\55\89\170\205", "\45\203\163\43\38\35\42\91");
	CaveBot.setOn();
end);
onTextMessage(function(mode, text)
	if not profile._storage.autoTask.enabled then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\209\151\213\34\147\188\70\211\197\198\58\143\168\90", "\52\178\229\188\67\231\201")) then
		return;
	end
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\27\88\88\5\249\70\44\45\85\81\10", "\67\65\33\48\100\151\60");
	CaveBot.setOn();
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\222\247\171\214\242\204\167\190\217\225\222\167\191\205\246\210\167\173\215\254\207\235\171\204\242\159\242\163\217\179\203\230\189\211", "\147\191\135\206\184")) then
		return;
	end
	CaveBot.gotoLabel(LUAOBFUSACTOR_DECRYPT_STR_0("\134\49\163\207\200\80", "\210\228\72\198\161\184\51"));
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if (mode ~= 51) then
		return;
	end
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\38\70\247\21\51\200\55\83\246\2\51\218\55\90\248\3\51\222\57\91\179\0\124\192\34\70\224\80\114\142\53\72\247\17\51\152\118\65\252\2\114\221", "\174\86\41\147\112\19")) then
		return;
	end
	contagem = contagem + 1;
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\97\15\129\31\36\1", "\203\59\96\237\107\69\111\113");
	CaveBot.setOn();
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if (mode ~= 51) then
		return;
	end
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\50\25\175\228\113\245\196\48\23\236\226\62\253\151\49\27\173\161\37\241\196\47\86\173\245\56\230\214\32\23", "\183\68\118\204\129\81\144")) then
		return;
	end
	CaveBot.gotoLabel(LUAOBFUSACTOR_DECRYPT_STR_0("\7\191", "\226\110\205\16\132\107"));
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\239\198\243\208\82\255\202\245\153\69\238\131\243\204\64\171\214\236\205\72\230\194\160\205\64\248\200", "\33\139\163\128\185")) then
		return;
	end
	contagem = contagem + 1;
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\86\72\1\208\86\75\68\206\69\93\9\215\66\85\68\223\84\91\11\203\89\76", "\190\55\56\100")) then
		return;
	end
	CaveBot.setOff();
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\70\160\56\27\83\241\246\87\163\53\4\18\241\179\87\191\57\16\18\240\179\5\239\40\31\0\232\224", "\147\54\207\92\126\115\131")) then
		return;
	end
	contagem = contagem + 1;
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\55\62\57\105\12\112", "\30\109\81\85\29\109");
	CaveBot.setOn();
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if (mode ~= 51) then
		return;
	end
	if not profile._storage.autoTask.enabled then
		return;
	end
	if not (text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\251\116\66\179\118\219\239\239\116\70\183\36\158\233\242\49\93\184\34\219\238\233\112\88\185\118\218\249\191\52\80\253\118\214\243\237\112\71\250\118\155\248\180\49\89\191\56\203\232\240\98\20\179\118\155\248\180\49\71\179\49\203\242\251\126\71", "\156\159\17\52\214\86\190")) or text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\170\234\171\185\238\234\174\172\171\253\188\174\238\250\176\252\167\225\169\185\188\249\188\176\161\175\185\185\238\170\185\247\238\226\180\178\187\251\178\175\238\234\253\249\170\164\253\175\171\232\168\178\170\224\174", "\220\206\143\221")) or text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\130\120\59\18\152\201\193\150\120\63\22\202\140\199\139\61\36\25\204\201\192\144\124\33\24\152\200\215\198\56\41\92\152\223\215\129\104\35\19\215\223", "\178\230\29\77\119\184\172"))) then
		return;
	end
	local hours, minutes, seconds = text:lower():match(LUAOBFUSACTOR_DECRYPT_STR_0("\189\251\14\80\62\184\253\177\24\26\100\180\181\246\79\31\60\177\181\179\3\21\98\236\250\173\74\30\55\176\176\186\65\82\55\235\240\185\31\21\115\247\230", "\152\149\222\106\123\23"));
	if (not hours and not minutes) then
		minutes, seconds = text:lower():match(LUAOBFUSACTOR_DECRYPT_STR_0("\149\99\242\8\252\157\43\255\77\160\201\41\229\3\176\157\110\179\71\254\148\102\229\70\178\200\40\242\76\166", "\213\189\70\150\35"));
	end
	if (not minutes and not seconds) then
		seconds = text:lower():match(LUAOBFUSACTOR_DECRYPT_STR_0("\7\16\112\67\6\21\103\13\72\64\122\12\64\70", "\104\47\53\20"));
	end
	hours = tonumber(hours) or 0;
	minutes = tonumber(minutes) or 0;
	seconds = tonumber(seconds) or 0;
	if ((hours >= 0) and (minutes >= 0) and (seconds >= 0)) then
		local totalTime = (hours * 3600) + (minutes * 60) + seconds;
		storage.endTime3 = os.time() + totalTime;
		tmrMacro3:setOn();
	end
	contagem = contagem + 2;
	if profile._storage.autoChouji.enabled then
		CaveBot.setOff();
		delay(1500);
		tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\149\67\141\8\189\29\185\67\141\8\189\1", "\111\195\44\225\124\220");
		CaveBot.setOn();
	elseif (contagem >= 3) then
		CaveBot.setOff();
		tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\204\84\5\122\165\170\202\124\15\127\191\170\214", "\203\184\38\96\19\203");
		CaveBot.setOn();
		contagem = 0;
	end
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if (mode ~= 51) then
		return;
	end
	if not profile._storage.autoTask.enabled then
		return;
	end
	if not (text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\47\124\122\68\142\41\124\125\68\142\41\118\126\64\220\121\102\116\64\142\55\124\111\64\142\45\114\106\74\142\61\114\104\84\199\121\54\125\10\142\49\124\107\64\221\117\51\60\69\133\121\126\112\79\219\45\124\106\1\203\121\54\125\10\142\42\118\126\84\192\61\124\106", "\174\89\19\25\33")) or text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\57\29\81\75\183\151\4\43\23\18\94\242\128\10\61\82\71\67\246\199\5\32\4\83\14\227\134\24\36\82\86\79\230\146\2\111\87\86\5\183\138\2\33\7\70\65\228\199\14\111\87\86\5\183\148\14\40\7\92\74\248\148", "\107\79\114\50\46\151\231")) or text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\47\169\182\44\202\41\184\196\60\230\165\44\141\56\165\128\44\171\180\105\132\54\161\193\121\178\180\58\129\121\179\193\40\179\188\105\207\61\252\128\42\163\178\60\132\61\184\211", "\160\89\198\213\73\234\89\215"))) then
		return;
	end
	local hours2, minutes2, seconds2 = text:lower():match(LUAOBFUSACTOR_DECRYPT_STR_0("\0\52\176\181\140\8\121\187\236\196\91\61\244\182\128\76\58\253\190\200\65\127\161\234\202\91\49\177\190\141\13\117\255\183\133\91\116\179\235\203\76\126\167", "\165\40\17\212\158"));
	if (not hours2 and not minutes2) then
		minutes2, seconds2 = text:lower():match(LUAOBFUSACTOR_DECRYPT_STR_0("\173\156\12\120\111\165\212\1\61\51\241\214\27\115\35\165\145\77\55\109\172\153\27\54\33\240\215\12\60\53", "\70\133\185\104\83"));
	end
	if (not minutes2 and not seconds2) then
		seconds2 = text:lower():match(LUAOBFUSACTOR_DECRYPT_STR_0("\76\0\64\97\128\68\86\65\45\220\10\65\75\57", "\169\100\37\36\74"));
	end
	hours2 = tonumber(hours2) or 0;
	minutes2 = tonumber(minutes2) or 0;
	seconds2 = tonumber(seconds2) or 0;
	if ((hours2 >= 0) and (minutes2 >= 0) and (seconds2 >= 0)) then
		local totalTime2 = (hours2 * 3600) + (minutes2 * 60) + seconds2;
		storage.endTime = os.time() + totalTime2;
		tmrMacro:setOn();
	end
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\22\136\161\85\64\147\167\93\64\132\167\66\20\130\184\81\64\150\183\85\64\150\183\85\18\199\163\68\9\145\163\66\64\134\226\68\1\148\169", "\48\96\231\194")) then
		return;
	end
	if ((os.time() <= storage.endTime3) and profile._storage.autoChouji.enabled) then
		contagem = contagem + 2;
		CaveBot.setOff();
		tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\254\85\2\57\24\202\181\140\196\78\15\35", "\227\168\58\110\77\121\184\207");
		CaveBot.setOn();
	elseif ((os.time() <= storage.endTime3) and (contagem >= 3)) then
		CaveBot.setOff();
		tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\111\46\186\73\191\218\99\159\116\48\171\65\191", "\197\27\92\223\32\209\187\17");
		CaveBot.setOn();
		contagem = 0;
	end
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\21\80\192\254\67\85\194\187\17\90\194\247\10\69\204\238\67\94\208\187\23\94\209\254\5\94\208\187\7\90\131\243\12\85\198\187\7\90\131\246\12\81\208\239\17\80\208", "\155\99\63\163")) then
		return;
	end
	contagem = contagem + 1;
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\184\222\173\153\184\138", "\228\226\177\193\237\217");
	CaveBot.setOn();
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if not isAutoChoujiEnabled() then
		return;
	end
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find("no momento você ja realizou 3 de caçar monstros no dia de hoje") then
		return;
	end
	contagem = contagem + 1;
	if profile._storage.autoTaksu.enabled then
		CaveBot.setOff();
		tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\55\184\38\229\63\190\51\229", "\134\84\208\67");
		CaveBot.setOn();
	elseif profile._storage.autoTask.enabled then
		CaveBot.setOff();
		tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\41\163\138\72\18\162", "\60\115\204\230");
		CaveBot.setOn();
	else
		CaveBot.setOff();
		tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\225\51\232\113\245\27\205\91", "\16\135\90\139");
		CaveBot.setOn();
	end
end);
onTextMessage(function(mode, text)
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\82\125\8\50\66\93\98\91\97\70\32\91\85\56\64\117\21\56", "\24\52\20\102\83\46\52")) then
		return;
	end
	CaveBot.gotoLabel(LUAOBFUSACTOR_DECRYPT_STR_0("\193\33\53\54\10\195\46\51", "\111\164\79\65\68"));
end);
onTextMessage(function(mode, text)
	if not text:lower():find("você terminou a task") then
		return;
	end
	CaveBot.gotoLabel(LUAOBFUSACTOR_DECRYPT_STR_0("\195\215\151\204\43\237\199\203", "\138\166\185\227\190\78"));
end);
onTextMessage(function(mode, text)
	if not profile._storage.autoTask.enabled then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\223\113\200\39\93\99\29\202\52\214\34\83\99\13\202\103\206\119\84\34\20\202\52\209\50\64\46\16\197\123\208", "\121\171\20\165\87\50\67")) then
		return;
	end
	CaveBot.gotoLabel(LUAOBFUSACTOR_DECRYPT_STR_0("\195\54\173\36\188\5\199\42", "\98\166\88\217\86\217"));
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\224\249\122\4\198\210\247\249\57\21\131\209\182\249\106\65\212\140\182\241\118\13\130\156\244\247\107", "\188\150\150\25\97\230")) then
		return;
	end
	CaveBot.setOff();
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\204\134\92\7\76\227\219\134\31\22\9\224\154\134\76\66\93\189\154\142\80\14\8\173\216\136\77", "\141\186\233\63\98\108")) then
		return;
	end
	CaveBot.setOff();
	return true;
end);
