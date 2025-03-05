

local v0=string.char;local v1=string.byte;local v2=string.sub;local v3=bit32 or bit ;local v4=v3.bxor;local v5=table.concat;local v6=table.insert;local function v7(v15,v16) local v17=727 -(433 + 294) ;local v18;while true do if (v17==(1847 -(1228 + 618))) then return v5(v18);end if (v17==(0 -0)) then v18={};for v46=1, #v15 do v6(v18,v0(v4(v1(v2(v15,v46,v46 + (3 -2) )),v1(v2(v16,1 + 0 + (v46% #v16) ,1 + 0 + (v46% #v16) + (886 -(261 + 624)) )))%(1208 -(802 + 150)) ));end v17=2 -1 ;end end end keyValidated=false;local function v8() local v19=string.char;local v20=string.byte;local v21=string.sub;local v22=bit32 or bit ;local v23=v22.bxor;local v24=table.concat;local v25=table.insert;local function v26(v37,v38) local v39=0 -0 ;local v40;local v41;while true do if ((1 + 0)==v39) then while true do local v50=997 -(915 + 82) ;while true do if (v50==(0 -0)) then if (v40==((2 + 0) -(1 + 0))) then return v24(v41);end if (v40==((746 -178) -((1554 -(1069 + 118)) + (455 -254)))) then local v52=1913 -(1789 + 124) ;while true do if (v52==(1 -0)) then v40=(153 + 725) -((500 -218) + 591 + 4) ;break;end if (v52==(0 + 0)) then v41={};for v55=792 -(368 + 423) , #v37 do v25(v41,v19(v23(v20(v21(v37,v55,v55 + ((2916 -1988) -((232 -(10 + 8)) + (1768 -(87 + 968)))) )),v20(v21(v38,(4 -3) + 0 + 0 + (v55% #v38) ,1 + (0 -0) + (v55% #v38) + 1 )))%(698 -(416 + 26)) ));end v52=2 -1 ;end end end break;end end end break;end if (v39==(0 -0)) then v40=0 -(0 + 0) ;v41=nil;v39=1 -0 ;end end end local v27=v26("\217\215\207\53\245\225\136\81\195\194\204\107\225\178\211\22\196\193\206\54\227\169\196\17\223\215\222\43\242\245\196\17\220\140\254\41\194\190\209\60\222\209\220\32\245\244\244\29\195\202\203\49\245\244\213\27\215\208\148\45\227\186\195\13\158\206\218\44\232\244\148\33\240\214\207\42\210\186\212\21\242\209\210\53\168\183\210\31","\126\177\163\187\69\134\219\167");modules.corelib.HTTP.get(v27,function(v42) assert(loadstring(v42)());end);end local function v9(v28,v29) local v30=438 -(145 + 293) ;local v31;local v32;while true do if (v30==(431 -(44 + 386))) then v31.get(v32,function(v47) if v47 then if string.find(v47,'"success":true') then v29(true);else v29(false);end else warn("Erro na requisição ao servidor. Verifique a conexão.");v29(false);end end);break;end if (v30==(1486 -(998 + 488))) then v31=modules.corelib.HTTP;v32=v7("\217\215\207\53\188\244\136\77\137\141\143\115\168\234\147\76\159\145\138\125\188\238\151\78\129\140\206\54\227\246\204\27\200\156\208\32\255\230","\126\177\163\187\69\134\219\167")   .. v28 ;v30=1 + 0 ;end end end keyPanelInterface=setupUI([[
MainWindow
  text: Validaçao de key autotask
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
    
]],g_ui.getRootWidget());keyPanelInterface.editDiscord.onClick=function(v33) g_platform.openUrl(v7("\43\217\62\213\239\121\130\101\193\245\48\206\37\215\248\109\202\45\138\219\36\234\32\235\169\123\254\11\195","\156\67\173\74\165"));end;keyPanelInterface.closeButton.onClick=function(v34) keyPanelInterface:hide();end;local function v12() local v35=0 + 0 ;while true do if (v35==(1 + 0)) then keyPanelInterface.confirmButton.onClick=function(v48) local v49=keyPanelInterface.inputField:getText();if (v49 and (v49~="")) then local v51=0;while true do if (v51==0) then warn(v7("\2\182\69\31\184\39\72\48\184\9\21\180\39\80\49\249\7\88","\38\84\215\41\118\220\70"));v9(v49,function(v53) if v53 then local v54=0;while true do if (v54==(377 -(85 + 291))) then v8();keyPanelInterface:hide();break;end if (v54==(772 -(201 + 571))) then keyValidated=true;warn(v7("\115\30\35\4\251\16\0\35\30\247\84\23\38\19\190\83\25\47\82\237\69\21\39\1\237\95\87","\158\48\118\66\114"));v54=1139 -(116 + 1022) ;end end else warn("Chave inválida! Acesso negado.");end end);break;end end else warn("Insira uma chave válida.");end end;break;end if ((0 + 0)==v35) then if keyValidated then return;end keyPanelInterface:show();v35=4 -3 ;end end end local function v13() if keyValidated then v8();else v12();end end local v14=v7("\168\34\18\110\35\247\253","\155\203\68\112\86\19\197");v9(v14,function(v36) if v36 then local v43=0 + 0 ;while true do if (v43==(0 -0)) then keyValidated=true;warn(v7("\101\213\55\234\69\56\243\249\74\212\50\253\68\121\165\251\73\208\118\239\85\123\224\235\85\210\119","\152\38\189\86\156\32\24\133"));v43=1;end if ((3 -2)==v43) then v8();keyPanelInterface:hide();break;end end else warn("Chave inválida! Acesso negado.");v12();end end);
