
startsumm = 5000
blindsumm = 500

secured = false
coloda = {}
for j = 0, 51 do
	coloda[#coloda + 1] = j
end
coordinigrok = {
	{10,200},
	{210,30},
	{395,30},
	{560,30},
	{745,200},
	{570,350},
	{400,350},
	{210,350}
	
}
coordincard = {
	{80,175},
	{200,85},
	{375,85},
	{540,85},
	{620,175},
	{540,265},
	{375,265},
	{200,265},
	{310, 170}
}
--fall, out, call, all_in
color_dey = {"#ff00ff", "#ffff00", "#ffcc00", "#ff0ff0", "#f5000f", "#ffffcc", "#ccff57", "#972721", "#456789", "#20B2AA"}

masti_chervi = {"2","3","4","5","6","7","8","9","10","V","D","K","T"}
masti_bubni = {"2","3","4","5","6","7","8","9","10","V","D","K","T"}
masti_trefi = {"2","3","4","5","6","7","8","9","10","V","D","K","T"}
masti_piki = {"2","3","4","5","6","7","8","9","10","V","D","K","T"}
symbol_chervi = "♥"
symbol_bubni = "♦"
symbol_trefi = "♣"
symbol_piki = "♠"
masti_map = {{masti_chervi,0xff0000,symbol_chervi},{masti_bubni,0xff0000,symbol_bubni},{masti_trefi,0x000000,symbol_trefi},{masti_piki,0x000000,symbol_piki}}

massinfo = {}

cardontable = {}
players = {}
play_ochered = {}
cardwin = {}
crug = 0
timer = 0
summ = 0
start_player = 0
idlxwin = {}
stringwin = ""
mapa = "@7550783"


tfm.exec.disableAutoScore(true) 
tfm.exec.disableAutoShaman(true) 
tfm.exec.disableAutoNewGame(true) 
tfm.exec.disableAfkDeath(true)
--tfm.exec.setUIMapName ("fg")
tfm.exec.newGame(mapa) 



function show_rule(pl)
	ui.addPopup(-10000, 1, "<p align='center'><font size='30px' color='#ffff00'>Конкурс \"Покер - Техасский Холдем\"</font><br><font size='14px'><font color='#00FFFF'>автор Deff83#0000</font><br><font size='11px'>В игре может участвовать от 2 до 8 человек. Все новые игроки распологают суммой в "..startsumm.."$. <br>Каждому игроку в Техасском Холдеме раздается по две карты. После раздачи начинается торговля по часовой стрелке, которая проходит в несколько раундов.<br>Два игрока по левую руку от дилера (Дилер здесь выбирается рандомно) делают обязательные ставки по "..blindsumm.."$, которые взимаются еще до начала торгов. Это делается для того, чтобы стимулировать игроков на активную игру. Эти ставки называются блайндами. <br>После того, как игроки поставили блайнды, начинается первый второй и третий этап торговли в ходе которых открываются карты на столе.<br>Правила игры в покер подразумевают наличие определенных действий, которые игрок совершает в процессе торговли:<br><p align='left'>    <font  color='#ffff00'>Поставить, бет (англ. bet)</font> – сделать ставку<br>    <font color='#ffff00'>Ответить, колл (англ. call)</font> – поставить столько же, сколько поставил соперник – уравнять<br>    <font  color='#ffff00'>Поднять, рейз (англ. raise)</font> – увеличить ставку – поставить больше, чем соперники<br>    <font  color='#ffff00'>Cбросить карты, фолд (англ. fold)</font> – отказаться от дальнейшего участия в игре и сбросить карты<br>    <font  color='#ffff00'>Пропустить, чек (англ. check)</font> – в ситуациях, когда ставка уже была сделана или ставки не были сделаны соперниками – не добавлять ничего в банк, оставить «как есть»<br><br><p align='center'><font size='14px'><font color='#00FFFF'>Читать правила дальше?</font></font></p>", pl, 100, 30, 600, true)
end

function show_dop(pl)
	ui.addPopup(-20000, 1, "<p align='center'><font size='30px' color='#ffff00'>Конкурс \"Покер - Техасский Холдем\"</font><br><font size='14px'><font color='#00FFFF'>автор Deff83#0000</font><br><font size='11px'>Круг торговли заканчивается тогда, когда все игроки сделали равные ставки или сбросили карты.<br>После первого круга торговли, если в раздаче остается больше одного человека, то, по правилам игры в покер, на стол кладутся три общие открытые карты, которые называют флоп. Общие карты нужно использовать для составления комбинаций.<br>Если и после этого раунда в раздаче остается больше одного человека, то кладут еще одну общую карту, которую называют терном. Аналогично флопу, после сдачи терна проводится еще один круг торговли.<br>После терна, если это необходимо, кладут последнюю общую карту – ривер.<br>После ривера следует еще один раунд торговли, и если после него на банк претендует два или более игроков, то происходит вскрытие.<br>Комбинации по правилам покера составляются из пяти общих карт и двух закрытых. Когда была осуществлена и уравнена последняя ставка, все оставшиеся в игре люди по очереди начинают открывать для противников свои карты. Из них составляются и оцениваются итоговые выигрышные комбинации.<br>Обладателем банка игры будет тот, у кого на руках окажется самая высокая комбинация из карт. Правила игры в покер предусматривают 10 возможных комбинаций.<br><br><p align='center'><font size='14px'><font color='#00FFFF'>Читать правила дальше?</font> </font></font></p>", pl, 100, 30, 600, true)
end

function show_dopk(pl)
	ui.addPopup(-30000, 0, "<p align='center'><font size='30px' color='#ffff00'>Конкурс \"Покер - Техасский Холдем\"</font><br><font size='14px'><font color='#00FFFF'>автор Deff83#0000</font><br><font size='14px'><br>Возможные комбинации от минимума очков до максимума:<br><p align='left'><font  color='#ffff00'>High Card</font> - старшая карта (нет комбинаций но у вас самая старшая карта) минимум очков<br><font  color='#ffff00'>Pair</font> - пара (2 одинаковых значения карт KK, 44, 55)<br><font  color='#ffff00'>Two Pair</font> - две пары (две по 2 одинаковых значения карт KK и 44, 55 и 77)<br><font  color='#ffff00'>Three of a Kind</font> - три совпадения (3 одинаковых значения карт KKK, 444, 555)<br><font  color='#ffff00'>Full-house</font> - фул хаус (3 одинаковых значения и пара KK555)<br><font  color='#ffff00'>Four of a Kind</font> - четыре совпадения (4 одинаковых значения карт KKKK, 4444)<br><font  color='#ffff00'>Flush</font> - флеш (5 одинаковых мастей ♣♣♣♣♣)<br><font  color='#ffff00'>Straight</font> - стрит (любая последовательность 56789, 789VD)<br><font  color='#ffff00'>Straight Flush</font> - стрит флеш (любая последовательность 56789, 8910VD но все масти одинаковые)<br><font  color='#ffff00'>Royal Flush</font> - стрит роял (последовательность 10VDKT все масти одинаковые) максимум очков</font></font></p>", pl, 100, 30, 600, true)
end





ui.addTextArea(-66000, "<a href='event:help'>help", nil, 725, 380, 50, 20, 1, 0x0000ff, 0.7,true)

--ui.addTextArea(-9, "<p align='center'> <a href='event:go'>поехали", adm, 10, 350, 100, 20, 1, 0xffffff, 0.7,true)
function buttomstart()
	for j = 1, 8 do
		ui.addTextArea(-j, "<p align='center'><font size='10px'><a href='event:start'>сесть", nil, coordinigrok[j][1], coordinigrok[j][2],  60, 18, 0x000000,0x0000ff, 0.7,false)
	end
end

function countmapa(massiv)
    i=0
    for p, x in pairs(massiv) do
        i=i+1
    end
    return i
end

buttomstart()
function eventTextAreaCallback(id, p, cmd)
	if cmd == "help" then
		show_rule(p)
	end
    if cmd == "start"  then
     for px, val in pairs(players) do
				if val.player == p then
					return
				end
		end
		ui.removeTextArea(id, p)
		ui.addTextArea(id, "<p align='center'><font size='10px'><a href='event:finish'>"..startsumm.."$", nil, coordinigrok[-id][1], coordinigrok[-id][2]+27,  70, 18, 0x000000,0x0000ff, 0.7,false)
		players[-id] = {}
		players[-id].player = p
		players[-id].card = {}
		players[-id].price = startsumm
		players[-id].stavka = 0
		tfm.exec.movePlayer(p,coordinigrok[-id][1]+30,coordinigrok[-id][2],false,0,0,false)
		
		end
		    if cmd == "fall"  then
				massinfo[#massinfo+1] ="<font color='"..color_dey[1].."'>fall</font>:"..p
				ui.removeTextArea(-12, nill)
				local idlx = play_ochered[tek_player]
				fall(idlx)
		end
		    if cmd == "finish"  then
			--if 2 == 1 then--if crug == 1 then
			
			
		----------------------------------------------------------------------------------------------9888888888888888888888888888888888
		local gt = -1
		for j = 1, #play_ochered do
			local idlx = play_ochered[j]
			--print("L          "..idlx)
			--print("L          "..play_ochered[tek_player])
			if players[idlx]~=nill then
				--print(players[idlx].player)
				if players[idlx].player == p then
					
					--print("88 "..p)
					players[idlx].price = 0
					gt = j
					local timeri = timer
					massinfo[#massinfo+1] ="<font color='"..color_dey[2].."'>out</font>:"..p
					fall(idlx)
					timer = timeri
					
					if idlx == play_ochered[tek_player] then
						timer = 39
					end
					
					--return
				end
			end
		end
		
		--else                                              players[play_ochered[tek_player]].player
			 for px, val in pairs(players) do
				if val.player == p then
					players[px] = nil
					if gt>0 then
						--table.remove(play_ochered, gt)
					end
					ui.addTextArea(-px, "<p align='center'><font size='10px'><a href='event:start'>сесть", nil, coordinigrok[px][1], coordinigrok[px][2],  60, 18, 0x000000,0x0000ff, 0.7,false)
					tfm.exec.movePlayer(p, 20,350,false,0,0,false)
					
					return
				end
			 end
		--end
				
		end
		    if cmd == "go"  then
				raspredcard()
		end
		    if cmd == "check"  then
				
				ui.removeTextArea(-11, nill)
		local idlx = play_ochered[tek_player]
				
				--print(idlx)
				if stavka < players[idlx].price then
					
					if stavka == players[idlx].stavka then
						massinfo[#massinfo+1] ="<font color='"..color_dey[3].."'>check</font>:"..p
					else
						massinfo[#massinfo+1] ="<font color='"..color_dey[6].."'>call "..stavka.."</font>:"..p
					end
					players[idlx].price = players[idlx].price - stavka + players[idlx].stavka 
					ui.updateTextArea(-idlx, "<p align='center'><font size='10px'><a href='event:finish'>"..players[idlx].price .."$")
					players[idlx].stavka = stavka
					ui.addTextArea(idlx+20, "<p align='center'><font size='10px'>"..players[idlx].stavka .."$", nil, coordincard[idlx][1]+10, coordincard[idlx][2]+55,  70, 18, 0x000000,0x0000ff, 0.7,false)
					
				else
				players[idlx].stavka = players[idlx].price + players[idlx].stavka
					ui.addTextArea(idlx+20, "<p align='center'><font size='10px'>"..players[idlx].stavka .."$", nil, coordincard[idlx][1]+10, coordincard[idlx][2]+55,  70, 18, 0x000000,0x0000ff, 0.7,false)
					
					players[idlx].price = 0
					massinfo[#massinfo+1] ="<font color='"..color_dey[5].."'>all in</font>:"..p
					ui.updateTextArea(-idlx, "<p align='center'><font size='10px'><a href='event:finish'>"..players[idlx].price .."$")
					
				end
				timer = 39
		end
		    if cmd == "podn"  then
				ui.removeTextArea(id, nil)
				         ui.addPopup(-4400, 2, "<p align='center'>Введите сумму!", p, 200, 200, 400, true)
			end
end
function eventPopupAnswer(id, p, cmd)
if id ==-10000 then
	if cmd=="yes" then
		show_dop(p)
	end
end
if id ==-20000 then
	if cmd=="yes" then
		show_dopk(p)
	end
end

---------------podnyati------
if id==-4400  then
local idlx = play_ochered[tek_player]
    if tonumber(cmd, 10) then
    	if   tonumber(cmd, 10)>stavka then
    if players[idlx]~=nill then
    		if tonumber(cmd, 10) < players[idlx].price then
					players[idlx].price = players[idlx].price - tonumber(cmd, 10) + players[idlx].stavka 
					ui.updateTextArea(-idlx, "<p align='center'><font size='10px'><a href='event:finish'>"..players[idlx].price .."$")
					players[idlx].stavka = tonumber(cmd, 10)
					stavka = tonumber(cmd, 10)
					ui.addTextArea(idlx+20, "<p align='center'><font size='10px'>"..players[idlx].stavka .."$", nil, coordincard[idlx][1]+10, coordincard[idlx][2]+55,  70, 18, 0x000000,0x0000ff, 0.7,false)
					massinfo[#massinfo+1] ="<font color='"..color_dey[4].."'>call "..stavka.."</font>:"..p
				else
				players[idlx].stavka = players[idlx].price 
					ui.addTextArea(idlx+20, "<p align='center'><font size='10px'>"..players[idlx].stavka .."$", nil, coordincard[idlx][1]+10, coordincard[idlx][2]+55,  70, 18, 0x000000,0x0000ff, 0.7,false)
					stavka = players[idlx].stavka 
					players[idlx].price = 0
					ui.updateTextArea(-idlx, "<p align='center'><font size='10px'><a href='event:finish'>"..players[idlx].price .."$")
					massinfo[#massinfo+1] ="<font color='"..color_dey[5].."'>all in</font>:"..p
					end
	end
					obhod = 1
					timer = 39
    	end
    end
end
end
function print_cart_zakrit(mouse_id, numb)
for j = 0,  2 do
	ui.addTextArea(mouse_id*10000+numb+j*1000000, "<font color='#000000' size='10px'>", nil, coordincard[mouse_id][1]+(numb-1)*55 + j*10, coordincard[mouse_id][2]+j*10,  50-j*20, 70-j*20, 0xaa1166, 0x990033, 1,false)
end
	--ui.addTextArea(mouse_id*10000+numb, "<font color='#000000' size='10px'>    ", nil, coordincard[mouse_id][1]+(numb-1)*55, coordincard[mouse_id][2],  50, 70, 0x000055, 0xffffff, 1,false)
end
function print_cart(masti, cart, mouse_id, numb)

	ui.addTextArea(mouse_id*100+numb, "<font color='#000000' size='13px'><b>"..masti_map[masti][1][cart], nil, coordincard[mouse_id][1]+(numb-1)*55, coordincard[mouse_id][2],  50, 70, 0xffffff, masti_map[masti][2], 0.2,false)
	printsymbol(mouse_id*100+numb*1000,masti, coordincard[mouse_id][1]+(numb-1)*55, coordincard[mouse_id][2], 0)
	if secured then 
	for j=1, 4 do
	if j == masti then
	else
		printsymbol(mouse_id*100+numb*1000+j*10000,j, coordincard[mouse_id][1]+(numb-1)*55, coordincard[mouse_id][2], 1)
	end
	end
	end
end
function printsymbol(mouseid,masti, xl, yl, secure)
	local colorca = 0xffffffff
	if masti == 1 or masti == 2 then
		colorca = 0xff0000
	elseif masti == 3 or masti == 4 then
		colorca = 0x000000
	end
	if secure == 1 then
		colorca = 0xffffffff
	end
	local x = xl +20
	local y = yl + 35
	if masti == 1 then
		tfm.exec.addPhysicObject(mouseid+1,x,y,{
		type=13,
		color = colorca,
		width=10,
		height=10,
		groundCollision=false,
		miceCollision=false
		})
tfm.exec.addPhysicObject(mouseid+2,x+14,y,{
		type=13,
		color = colorca,
		width=10,
		height=10,
		groundCollision=false,
		miceCollision=false
		})
tfm.exec.addPhysicObject(mouseid+3,x+7,y+7,{
		type=12,
		color = colorca,
		width=20,
		height=20,
		groundCollision=false,
		miceCollision=false,
		angle = 45

		})
	elseif masti == 2 then
		tfm.exec.addPhysicObject(mouseid+3,x+5,y,{
		type=12,
		color = colorca,
		width=20,
		height=20,
		groundCollision=false,
		miceCollision=false,
		angle = 45

		})
	elseif masti == 3 then
		tfm.exec.addPhysicObject(mouseid+3,x+7,y-9,{
		type=13,
		color = colorca,
		width=10,
		height=10,
		groundCollision=false,
		miceCollision=false
		})
tfm.exec.addPhysicObject(mouseid+1,x,y,{
		type=13,
		color = colorca,
		width=10,
		height=10,
		groundCollision=false,
		miceCollision=false
		})
tfm.exec.addPhysicObject(mouseid+2,x+14,y,{
		type=13,
		color = colorca,
		width=10,
		height=10,
		groundCollision=false,
		miceCollision=false
		})
tfm.exec.addPhysicObject(mouseid+4,x+7,y+10,{
		type=12,
		color = colorca,
		width=10,
		height=20,
		groundCollision=false,
		miceCollision=false,
		

		})
tfm.exec.addPhysicObject(mouseid+5,x+7,y+20,{
		type=12,
		color = colorca,
		width=30,
		height=10,
		groundCollision=false,
		miceCollision=false,
		

		})
	elseif masti == 4 then
		tfm.exec.addPhysicObject(mouseid+3,x+7,y-8,{
		type=12,
		color = colorca,
		width=20,
		height=20,
		groundCollision=false,
		miceCollision=false,
	angle = 45
		})
tfm.exec.addPhysicObject(mouseid+1,x,y,{
		type=13,
		color = colorca,
		width=10,
		height=10,
		groundCollision=false,
		miceCollision=false
		})
tfm.exec.addPhysicObject(mouseid+2,x+14,y,{
		type=13,
		color = colorca,
		width=10,
		height=10,
		groundCollision=false,
		miceCollision=false
		})
tfm.exec.addPhysicObject(mouseid+4,x+7,y+10,{
		type=12,
		color = colorca,
		width=10,
		height=20,
		groundCollision=false,
		miceCollision=false,
		

		})
tfm.exec.addPhysicObject(mouseid+5,x+7,y+20,{
		type=12,
		color = colorca,
		width=30,
		height=10,
		groundCollision=false,
		miceCollision=false,
		

		})
	end
	
end
function eventPlayerDied(nick)
tfm.exec.respawnPlayer(nick)
end
function newcoloda()
	coloda = {}
for j = 0, 51 do
	coloda[#coloda + 1] = j
end
end
function raspredcard()
	gamecol = 0
	for id, val in pairs(players) do
		gamecol = gamecol + 1
	end
	--print(gamecol)
if gamecol > 1 then
ui.removeTextArea(-15, nil)
ui.addTextArea(-16, "<p align='center'><font size='10px' color='#006600'>POKER. After by Deff83#0000", nil, 240, 245, 300, 40, 0xffffffff, 0.7,false)
--ui.removeTextArea(-16, nil)
	local ochered = {}
	----sort 1-8
	
	for j = 1, 8 do
	
	for id, val in pairs(players) do
	if id == j then
	--print(id)
	ochered[#ochered + 1] = id
		local randomcard = math.random(1, #coloda)
		local carde = coloda[randomcard]
		table.remove(coloda, randomcard)
		players[id].card[1] = carde
		print_cart(math.floor(carde/13)+1, carde%13+1, id, 1)
		print_cart_zakrit(id, 1)
		
		removecard_zacr(id, 1, players[id].player)
		local randomcard = math.random(1, #coloda)
		local carde = coloda[randomcard]
		table.remove(coloda, randomcard)
		players[id].card[2] = carde
		print_cart(math.floor(carde/13)+1, carde%13+1, id, 2)
		
		print_cart_zakrit(id, 2)
		removecard_zacr(id, 2, players[id].player)
	ui.addTextArea(-id, "<p align='center'><font size='10px'><a href='event:finish'>"..players[id].price.."$", nil, coordinigrok[id][1], coordinigrok[id][2]+27,  70, 18, 0x000000,0x0000ff, 0.7,false)
	else
	end
	end
	end
	--if start_player = 0 then
		start_player = math.random(1, #ochered)
	--end
	play_ochered = {}
	for j=1, #ochered do
		if start_player ==  #ochered + 1 then
			 start_player = 1
		end
		play_ochered[j] = ochered[start_player]
		start_player = start_player + 1
	end
	timer = 39
	crug = 1
	massinfo[#massinfo+1] ="<font color='"..color_dey[9].."'>Start</font>:"
else
	ui.addTextArea(-15, "<p align='center'><font size='60px' color='#006600'>POKER", nil, 100, 160,  600, 90, 0xffffffff, 0.7,false)
	ui.addTextArea(-16, "<p align='center'><font size='10px' color='#006600'>After by Deff83#0000", nil, 380, 230,  150, 40, 0xffffffff, 0.7,false)
end

end
typecrug = 0
tek_player = 1
cruglocal = 0
stavka = 0
obhod = 0
mousefall = {}
utimer = false
function eventLoop()
	timer = timer + 1
	if timer % 40 > 29 then
	local ost = 9-(timer % 40) + 29
		--ui.updateTextArea(-14,  "<p align='center'><font size='10px'>"..ost)
		if utimer then
			ui.addTextArea(-14, "<p align='center'><font size='10px'>"..ost, nil, coordinigrok[play_ochered[tek_player]][1]-10, coordinigrok[play_ochered[tek_player]][2]-10,  15, 15, 0x000000,0xffffff, 0.7,false)
		end
	end
	if timer % 40 == 38 then
		if crug == 1 then
			if cruglocal == 1 then
				local idlx = play_ochered[tek_player]
				fall(idlx)
				
				if players[play_ochered[tek_player]]~=nill then
					massinfo[#massinfo+1] ="<font color='"..color_dey[1].."'>time out</font>:"..players[play_ochered[tek_player]].player
				end
				timer = 0
			end
		end
	end
	if timer % 40 == 0 then
	
		if crug == 1 then
			if obhod == #play_ochered then
				--print("obhod")
				for j = 1, #play_ochered do
					local idlx = play_ochered[j]
					if players[idlx]~= nill then
						
						summ = summ + players[idlx].stavka
						players[idlx].stavka = 0
						
					end
					ui.removeTextArea(idlx+20, nil)
				end
				ui.addTextArea(-13, "<p align='center'><font color='#ffffff' size='10px'> Банк: "..summ, nil,10, 20, 100, 20, 1, 0xffffff, 0.7,true)
				if typecrug == 0 then
				for k= 1, 3 do
					local randomcard = math.random(1, #coloda)
					local carde = coloda[randomcard]
					table.remove(coloda, randomcard)
					cardontable[#cardontable + 1] = carde
					print_cart(math.floor(carde/13)+1, carde%13+1, 9, k)
				end
					typecrug = 1
				elseif typecrug == 1 then
					local randomcard = math.random(1, #coloda)
					local carde = coloda[randomcard]
					table.remove(coloda, randomcard)
					cardontable[#cardontable + 1] = carde
					print_cart(math.floor(carde/13)+1, carde%13+1, 9, 4)
					typecrug = 2
				elseif typecrug == 2 then
					local randomcard = math.random(1, #coloda)
					local carde = coloda[randomcard]
					table.remove(coloda, randomcard)
					cardontable[#cardontable + 1] = carde
					print_cart(math.floor(carde/13)+1, carde%13+1, 9, 5)
					--print("проверка")
					proverca()
					return
					---------------------------------
				elseif typecrug == 3 then
					
				end
				stavka = 0
				obhod = 0
			end
			ui.removeTextArea(-10, nil)
			ui.removeTextArea(-11, nil)
			ui.removeTextArea(-12, nil)
			ui.removeTextArea(-14, nil)
			ui.addPopup(-4400, 2, "<p align='center'>Введите сумму!", nill, -200, -200, 400, true)
			if cruglocal == 0 then
				local idlx = play_ochered[1]
				if players[idlx]~= nill then
					local blindsumm_pol = math.floor(blindsumm/2)
					ui.addTextArea(idlx+20, "<p align='center'><font size='10px'>"..blindsumm_pol.."$", nil, coordincard[idlx][1]+10, coordincard[idlx][2]+55,  70, 18, 0x000000,0x0000ff, 0.7,false)
					players[idlx].price = players[idlx].price - blindsumm_pol
					players[idlx].stavka = blindsumm_pol
					--print(players[idlx].price)
					ui.updateTextArea(-idlx, "<p align='center'><font size='10px'><a href='event:finish'>"..players[idlx].price .."$")
					
					
				 idlx = play_ochered[2]
					ui.addTextArea(idlx+20, "<p align='center'><font size='10px'>"..blindsumm.."$", nil, coordincard[idlx][1]+10, coordincard[idlx][2]+55,  70, 18, 0x000000,0x0000ff, 0.7,false)
					players[idlx].price = players[idlx].price - blindsumm
					players[idlx].stavka = blindsumm
					ui.updateTextArea(-idlx, "<p align='center'><font size='10px'><a href='event:finish'>"..players[idlx].price .."$")
					end
					stavka = blindsumm
				
				cruglocal = 1
				obhod = 0
			end
			
			----------------------------------------------------------99999999999999999999997
			if players[play_ochered[tek_player]]~=nill then--
			
			
				ui.addTextArea(-play_ochered[tek_player], "<p align='center'><font size='10px'><a href='event:finish'>"..players[play_ochered[tek_player]].price.."$", nil, coordinigrok[play_ochered[tek_player]][1], coordinigrok[play_ochered[tek_player]][2]+27,  70, 18, 0x000000,0x0000ff, 0.7,false)
			end
				
			tek_player = tek_player + 1
			
			obhod = obhod + 1
			if tek_player > #play_ochered then
			--print(45)
				tek_player = 1
			end
			if isContain(mousefall,play_ochered[tek_player]) then
				timer = 39
				return
			end
			--print(play_ochered[tek_player])
			--print(players[play_ochered[tek_player]].player)
			utimer = true
				ui.addTextArea(-play_ochered[tek_player], "<p align='center'><font size='10px'><a href='event:finish'>"..players[play_ochered[tek_player]].price.."$", nil, coordinigrok[play_ochered[tek_player]][1], coordinigrok[play_ochered[tek_player]][2]+27,  70, 18, 0xaaaa00,0x0000ff, 0.7,false)
			if players[play_ochered[tek_player]].price > 0 then
				ui.addTextArea(-10, "<p align='center'><font color='#ffffff' size='10px'> <a href='event:podn'>Raise", players[play_ochered[tek_player]].player, 690, 290, 100, 20, 1, 0xffffff, 0.7,true)
				ui.addTextArea(-11, "<p align='center'> <font color='#ffffff' size='10px'><a href='event:check'>check", players[play_ochered[tek_player]].player, 690, 320, 100, 20, 1, 0xffffff, 0.7,true)
				if players[play_ochered[tek_player]].stavka == stavka then
				else
					local callstavka = stavka - players[play_ochered[tek_player]].stavka
					ui.updateTextArea(-11, "<p align='center'> <font color='#ffffff' size='10px'><a href='event:check'>call("..callstavka.."$)")
				end
				else
					timer = 39
				end
				ui.addTextArea(-12, "<p align='center'> <font color='#ffffff' size='10px'><a href='event:fall'>fold", players[play_ochered[tek_player]].player, 690, 350, 100, 20, 1, 0xffffff, 0.7,true)
			--else
								--print("TYT")
								-- table.remove(play_ochered, tek_player)
								-- obhod = obhod - 1
								-- tek_player = tek_player - 1
								-- if tek_player < 1 then
								-- print(45)
									-- tek_player = #play_ochered - 1
								-- end
								-- obhod = obhod + 1
								-- tek_player = tek_player + 1
								-- if tek_player > #play_ochered then
							-- print(45)
								-- tek_player = 1
							-- end
							
							
							--obhod = obhod + 1
								
								--timer = 39
			--end
		elseif crug == 2 then
			for j = 1, #idlxwin do
				removecard(idlxwin[j], 1)
				removecard(idlxwin[j], 2)
			end
			for j = 1, 5 do
				removecard(9, j)
			end
			ui.removeTextArea(-13, nil)
			ui.removeTextArea(-15, nil)
			raspredcard()
		end
	end
	messageinfo(nil)
end
function isContain(mapalist, elementval)
boolcont = false
	for j = 1, #mapalist do
				if mapalist[j] == elementval then
					boolcont = true
				end
			end
		return boolcont
end
function fall(id)
	
	if isContain(mousefall,id)==false then
		mousefall[#mousefall+1] = id
		--print("mousefall")
	end
	removecard(id, 1)
	removecard(id, 2)
	
	removecard_zacr(id, 1, nil)
	removecard_zacr(id, 2, nil)
	
	--print(#play_ochered - #mousefall)
	if #play_ochered - #mousefall < 2 then
		for j = 1, #play_ochered do
				local idlx = play_ochered[j]
				if players[idlx]~=nil then
					if players[idlx].stavka == nil then
					else
					summ = summ + players[idlx].stavka
					end
				end
		end
		proverca()
		return
	end
	timer = 39
end
function removecard_zacr(moseid, numb, pl)
	if moseid~=nill and numb~=nill then
		ui.removeTextArea(moseid*10000+numb, pl)
		for j = 1, 13 do
		ui.removeTextArea(moseid*10000+numb + 1000000*j, pl)
		end
	end
end
function removecard(moseid, numb)
	if moseid~=nill and numb~=nill then
		ui.removeTextArea(moseid*100+numb, nil)
		for j = 1, 5 do
			tfm.exec.removePhysicObject(moseid*100+numb*1000+j)
		end
		if secured then
		for k = 1, 5 do
		for j = 1, 5 do
			tfm.exec.removePhysicObject(moseid*100+numb*1000+j+k*10000)
		end
		end
		end
	end
end
function proverca()
ui.addPopup(-4400, 2, "<p align='center'>Введите сумму!", nill, -200, -200, 400, true)
utimer = false
timer = 0
crug = 2
	mosepoint = -1
	cardwinne = {}
	idlxwin = {}
	stringwin = "Fold"
	local stringwinw = "Fold"
	local iddelplayer = {}
	
	for j = 1, #play_ochered do
		local idlx = play_ochered[j]
		
		if players[idlx]~=nill then
		
		if isContain(mousefall, idlx) then
		else
			local ochkim = pointstrit(idlx)
			
			if ochkim > mosepoint then
				stringwinw = stringwin
				cardwinne = cardwin
				mosepoint = ochkim
				
				idlxwin = {}
				idlxwin[1] = idlx
			elseif ochkim == mosepoint then
				idlxwin[#idlxwin+1] = idlx
			end
		end
		
		
			players[idlx].stavka = 0
		end
		ui.removeTextArea(idlx+20, nil)
		
	end
	for j = 1, 8 do
		removecard_zacr(j, 1, nil)
		removecard_zacr(j, 2, nil)
	end
	--------------------------------------------------------------------------
	lent = string.len(stringwinw) * 25
	ui.addTextArea(-15, "<p align='center'><font size='40px'>"..stringwinw, nil, 400-math.floor((lent+20)/2), 190,  lent+20, 60, 0xffffffff, 0.7,false)
	
	for j = 1, #play_ochered do
	local idlx = play_ochered[j]
	if  isContain(idlxwin, idlx) then
	else
		removecard(idlx, 1)
		removecard(idlx, 2)
	end
	end
	for j = 1, 5 do
		if isContain(cardwinne,j) then 
		else
				removecard(9, j)
		end
	end
	if #idlxwin > 1 then
	else
	
	
	if isContain(cardwinne,7) then
	else
		removecard(idlxwin[1], 2)
	end
	if isContain(cardwinne,6) then
	else
		removecard(idlxwin[1], 1)
	end
	end	
			
			
			
		
		
	
	local pricehy = -1
	
	local textwinrer = ""
	for j = 1, #idlxwin do
		pricehy = players[idlxwin[j]].price
		players[idlxwin[j]].price = players[idlxwin[j]].price + math.floor( summ / #idlxwin)
		ui.updateTextArea(-idlxwin[j], "<p align='center'><font size='10px'><a href='event:finish'>"..players[idlxwin[j]].price .."$")
		textwinrer = textwinrer..players[idlxwin[j]].player.."<br>"
	end
	
	for j = 1, #play_ochered do
		local idlx = play_ochered[j]
		if players[idlx]~=nill then
	if players[idlx].price < blindsumm then
			iddelplayer[#iddelplayer+1] = idlx
		end
		end
	end
	--print(pricehy)
	if math.floor( summ / #idlxwin) < pricehy or pricehy==-1 then
		ui.addTextArea(-13, "<p align='center'><font color='#ffffff' size='10px'> WIN</font><font color='#ffffff' size='10px'><br>"..textwinrer.."+"..math.floor( summ / #idlxwin), nil,10, 20, 100, nil, 1, 0xffffff, 0.7,true)
	elseif math.floor( summ / #idlxwin) < 2*pricehy then
		--extra
		ui.addTextArea(-13, "<p align='center'><font color='#ffffff' size='10px'> EXTRA WIN</font><font color='#ffffff' size='10px'><br>"..textwinrer.."+"..math.floor( summ / #idlxwin), nil,10, 20, 100, nil, 0xFFA500, 0xffffff, 0.7,true)
	elseif math.floor( summ / #idlxwin) < 4*pricehy then
		--super
		ui.addTextArea(-13, "<p align='center'><font color='#ffffff' size='10px'> SUPER WIN</font><font color='#ffffff' size='10px'><br>"..textwinrer.."+"..math.floor( summ / #idlxwin), nil,10, 20, 100, nil, 0xFF8C00, 0xffffff, 0.7,true)
	else
		--mega
		ui.addTextArea(-13, "<p align='center'><font color='#ffffff' size='10px'> MEGA WIN</font><font color='#ffffff' size='10px'><br>"..textwinrer.."+"..math.floor( summ / #idlxwin), nil,10, 20, 100, nil, 0xFF4500, 0xffffff, 0.7,true)
	end
	
	for j = 1, #iddelplayer do
		delplayer(iddelplayer[j])
	end
	summ = 0
	newcoloda()
	typecrug = 0
tek_player = 1
cruglocal = 0
stavka = 0
obhod = 0
mousefall = {}
cardontable = {}
ui.removeTextArea(-10, nil)
			ui.removeTextArea(-11, nil)
			ui.removeTextArea(-12, nil)
			ui.removeTextArea(-14, nil)

end
function delplayer(idlx)
if players[idlx]~=nill then
	local playerdel = players[idlx].player
	players[idlx] = nil
	ui.addTextArea(-idlx, "<p align='center'><font size='10px'><a href='event:start'>сесть", nil, coordinigrok[idlx][1], coordinigrok[idlx][2],  60, 18, 0x000000,0x0000ff, 0.7,false)
	tfm.exec.movePlayer(playerdel, 20,350,false,0,0,false)
end
end
function pointstrit(idlx)
cardwin = {}
	local point = 0
	local cardsev = {}
	local cardone = 2
	if players[idlx]~=nill then
		cardone = players[idlx].card[1]
	end
	cardsev[6] = {math.floor(cardone/13)+1, cardone%13+1}
	local cardtwo = 2
	if players[idlx]~=nill then
		cardtwo = players[idlx].card[2]
	end
	cardsev[7] = {math.floor(cardtwo/13)+1, cardtwo%13+1}
	for j = 1, #cardontable do
		cardsev[j] = {math.floor(cardontable[j] /13)+1, cardontable[j] %13+1}
	end
	
	--print("hhhhhhhhhhhhhh")
	--for j = 1, 7 do
	--	print(cardsev[j][1])
	--end
	
	if #cardontable == 5 then
		
	---------------ФЛЭШ распред------------------------
	z = {}
	maxz = 0
	k_maxz = 0
	for k = 1, 4 do
		local zx = 0
		local cardz = {}
		local jwin = {}
		for j = 1, 7 do
			if cardsev[j][1] == k then
				zx = zx + 1
				cardz[#cardz + 1] = cardsev[j][2]
				jwin[#jwin + 1] = j
			end
		end
		z[k] = {zx, cardz, jwin}
		if maxz < zx then
			maxz = zx
			k_maxz = k
		end
	end
	---------------ФЛЭШ------------------------
	if maxz > 4 then
		local cardfive = z[k_maxz][2]
		table.sort(cardfive)
		
		
		pointz = 1E12 * cardfive[#cardfive] + 1E10 * cardfive[#cardfive-1] + 1E8 * cardfive[#cardfive-2] + 1E6 * cardfive[#cardfive-3] + 1E4 * cardfive[#cardfive-4]
			if pointz > point then
				cardwin = z[k_maxz][3]
				stringwin = "Flush"
				point = pointz
			end
		--print("Flash")
		----------------------------СТРИТ ФЛЭШ---------------------------------
		if cardfive[#cardfive] == 13 then
			if cardfive[4] - cardfive[1] == 3 then
			if cardfive[1] == 2 then
				--print("Strit-flash0")
				pointz = 1E18 * cardfive[4]
				if pointz > point then
					cardwin = z[k_maxz][3]
					stringwin = "Straight Flush"
					point = pointz
				end
			end
			end
		end
		
		
		if cardfive[#cardfive] - cardfive[#cardfive-4] == 4 then
			--print("Strit-flash1")
			pointz = 1E18 * cardfive[#cardfive]
			if cardfive[#cardfive] == 13 then
				pointz = 1E20 * cardfive[#cardfive]
				--print("Flash-royali")
			end
			if pointz > point then
				cardwin = z[k_maxz][3]
				stringwin = "Royal Flush"
				point = pointz
			end
		end
		if #cardfive-5 > 0 then
		if cardfive[#cardfive-1] - cardfive[#cardfive-5] == 4 then
			--print("Strit-flash2")
			pointz = 1E18 * cardfive[#cardfive-1]
			if pointz > point then
				cardwin = z[k_maxz][3]
				stringwin = "Straight Flush"
				point = pointz
			end
		end
		end
		if #cardfive-6 > 0 then
		if cardfive[#cardfive-2] - cardfive[#cardfive-6] == 4 then
			--print("Strit-flash3")
			pointz = 1E18 * cardfive[#cardfive-2]
			if pointz > point then
				cardwin = z[k_maxz][3]
				stringwin = "Straight Flush"
				point = pointz
			end
		end
		end
		
	end
	---------------Стрит распред------------------------
	z = {}
	maxz = 0
	k_maxz = 0
	key = {}
	for k = 1, 13 do
		local zx = 0
		local cardz = {}
		for j = 1, 7 do
			if cardsev[j][2] == k then
				zx = zx + 1
				cardz[#cardz + 1] = j
			end
		end
		z[k] = {zx, cardz}
		if #cardz > 0 then
		key[#key + 1] = k
		end
		if maxz <= zx then
			maxz = zx
			k_maxz = k
		end
	end
	for j = 1, #key do
		--print(key[j])
	end
	--print(maxz)
	---------------------СТРИТ------------------
	if key[#key] == 13 then
			if key[4] - key[1] == 3 then
			if key[1] == 2 then
				--print("Strit0")
				pointz = 1E10 * key[4]
				if pointz > point then
					cardwin = {}
					--print(z[key[1]][2][1])
					cardwin[1] = z[key[1]][2][1]
					cardwin[2] = z[key[2]][2][1]
					cardwin[3] = z[key[3]][2][1]
					cardwin[4] = z[key[4]][2][1]
					cardwin[5] = z[key[#key]][2][1]
					stringwin = "Straight"
					point = pointz
				end
			end
			end
		end
	for j = 0, #key - 5 do
		
		if key[#key-j] - key[#key-4-j] == 4 then
			pointz = 1E10 * key[#key-j]
			--print("Strit")
			if pointz > point then
				cardwin = {}
					cardwin[1] = z[key[#key-j]][2][1]
					cardwin[2] = z[key[#key-j]-1][2][1]
					cardwin[3] = z[key[#key-j]-2][2][1]
					cardwin[4] = z[key[#key-j]-3][2][1]
					cardwin[5] = z[key[#key-j]-4][2][1]
				stringwin = "Straight"
				point = pointz
			end
		end
	end
	------------------КАРЭ-------------
	if maxz == 4 then
		pointz = 1E16 * k_maxz
			--print("Care")
			if pointz > point then
				cardwin = z[k_maxz][2]
				point = pointz
				stringwin = "Four of a Kind"
			end
	end
	---------------Трипс--------------
	if maxz == 3 then
		local fullhosetwo = 0
		for k = 1, 13 do
			if z[k][1] > 1 then
				if k == k_maxz then
				else
					fullhosetwo = k
					cardwin[4] = z[k][2][1]
					cardwin[5] = z[k][2][2]
					
					
				end
			end
		end
		if fullhosetwo == 0 then
			pointz = 1E8 * k_maxz
			--print("Trips")
			if pointz > point then
				cardwin[1] = z[k_maxz][2][1]
				cardwin[2] = z[k_maxz][2][2]
				cardwin[3] = z[k_maxz][2][3]
				point = pointz
				stringwin = "Three of a Kind"
			end
		else
			-----------------Фул-хаус------------
			pointz = 1E14 * k_maxz + 1E12 * fullhosetwo
			--print("Full-house")
			if pointz > point then
				cardwin[1] = z[k_maxz][2][1]
				cardwin[2] = z[k_maxz][2][2]
				cardwin[3] = z[k_maxz][2][3]
				stringwin = "Full House"
				point = pointz
			end
		end
	end
	------------------Para-----------------
	if maxz == 2 then
		local fullhosetwo = 0
		for k = 1, 13 do
			if z[k][1] > 1 then
				if k == k_maxz then
				else
					fullhosetwo = k
					cardwin[3] = z[k][2][1]
					cardwin[4] = z[k][2][2]
					
				end
			end
		end
		if fullhosetwo == 0 then
			pointz = 1E4 * k_maxz
			--print("Para")
			if pointz > point then
				stringwin = "Pair"
				point = pointz
				cardwin[1] = z[k_maxz][2][1]
				cardwin[2] = z[k_maxz][2][2]
				
			end
		else
			-----------------Две пары------------
			pointz = 1E6 * k_maxz + 1E4 * fullhosetwo
			--print("Second-Paras")
			if pointz > point then
				cardwin[1] = z[k_maxz][2][1]
				cardwin[2] = z[k_maxz][2][2]
				stringwin = "Two Pair"
				point = pointz
			end
		end
	end
	if maxz == 1 then
		pointz = 1E2 * k_maxz
			--print("Starshay")
			if pointz > point then
				stringwin = "High Card"
				point = pointz
				cardwin[1] = z[k_maxz][2][1]
			end
	end
	

	end
	--print(point)
	return point
end
function eventPlayerLeft(p)


----------------------------------------------------------------------------------------------9888888888888888888888888888888888
		local gt = -1
		for j = 1, #play_ochered do
			local idlx = play_ochered[j]
			--print("L          "..idlx)
			--print("L          "..play_ochered[tek_player])
			if players[idlx]~=nill then
				--print(players[idlx].player)
				if players[idlx].player == p then
					
					--print("88 "..p)
					players[idlx].price = 0
					gt = j
					local timeri = timer
					fall(idlx)
					timer = timeri
					
					if idlx == play_ochered[tek_player] then
						timer = 39
					end
					
					--return
				end
			end
		end
		
		--else                                              players[play_ochered[tek_player]].player
			 for px, val in pairs(players) do
				if val.player == p then
					players[px] = nil
					if gt>0 then
						--table.remove(play_ochered, gt)
					end
					ui.addTextArea(-px, "<p align='center'><font size='10px'><a href='event:start'>сесть", nil, coordinigrok[px][1], coordinigrok[px][2],  60, 18, 0x000000,0x0000ff, 0.7,false)
					tfm.exec.movePlayer(p, 20,350,false,0,0,false)
					
					return
				end
			 end

















	-- if crug == 1 then
			
			
		-- ----------------------------------------------------------------------------------------------
		-- for j = 1, #play_ochered do
			-- local idlx = play_ochered[j]
			-- --print("gggggggggggg")
			-- --print(players[idlx].player)
			-- if players[idlx].player == pName then
				-- players[idlx].price = 0
				-- fall(idlx)
				
				-- return
			-- end
		-- end
		-- else
			 -- for px, val in pairs(players) do
				-- if val.player == pName then
					-- players[px] = nil
					-- ui.addTextArea(-px, "<p align='center'><font size='10px'><a href='event:start'>сесть", nil, coordinigrok[px][1], coordinigrok[px][2],  60, 18, 0x000000,0x0000ff, 0.7,false)
					-- tfm.exec.movePlayer(p, 20,350,false,0,0,false)
					-- return
				-- end
			 -- end
		-- end
end


--показывает информацию
function messageinfo(pl)
	

	
	local stringinfo = ""
	
	for i=1, countmapa(massinfo) do
		if i<8 then
			stringinfo = stringinfo..massinfo[countmapa(massinfo)-i+1]
			if i <= countmapa(massinfo)-1 then
				stringinfo = stringinfo.."<br>"
			end
		end
	end
	

	ui.addTextArea(-57000, stringinfo, pl, 800-80, 20, 200, nil, 0x000001, 0xFFFFFF, 0.7, false)


end


function eventNewPlayer(playerName)
	ui.addTextArea(-66000, "<a href='event:help'>help", nil, 725, 380, 50, 20, 1, 0x0000ff, 0.7,true)
	tfm.exec.respawnPlayer (playerName)
	for j = 1, 8 do
		local boolzanit = true
		for px, val in pairs(players) do
			if px == j then
				boolzanit = false
			end
		end
		if boolzanit then
			ui.addTextArea(-j, "<p align='center'><font size='10px'><a href='event:start'>сесть", nil, coordinigrok[j][1], coordinigrok[j][2],  60, 18, 0x000000,0x0000ff, 0.7,false)
		else
			
			ui.addTextArea(-j, "<p align='center'><font size='10px'><a href='event:finish'>"..players[j].price.."$", nil, coordinigrok[j][1], coordinigrok[j][2]+27,  70, 18, 0x000000,0x0000ff, 0.7,false)
		end
	end
end
crug = 2
raspredcard()