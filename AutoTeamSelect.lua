local Tab = gui.Tab(gui.Reference("Misc"), "Carters-Team-Selector", "Carter's Team Selector")

local autoTeam = gui.Combobox(Tab, "autoTeam", "Select team to auto join", "Terrorist", "Counter-Terrorist")

local lastValueTeam = autoTeam:GetValue()

local function updateTeam()
	local LocalPlayer = entities.GetLocalPlayer()
	
	if autoTeam:GetValue() == 0 then
		if LocalPlayer:GetTeamNumber() ~= 2 then
			client.Command("jointeam 2", false)
		end
	end
	if autoTeam:GetValue() == 1 then
		if LocalPlayer:GetTeamNumber() ~= 3 then
			client.Command("jointeam 3", false)
		end
	end
end

callbacks.Register("Draw", function()
	if lastValueTeam ~= autoTeam:GetValue() then
		lastValueTeam = autoTeam:GetValue()
		updateTeam()
	end
end)

callbacks.Register("FireGameEvent", function(event)
	if event:GetName() == "round_end" then updateTeam() end
	if event:GetName() == "round_start" then updateTeam() end
	if event:GetName() == "round_poststart" then updateTeam() end
	if event:GetName() == "round_prestart" then updateTeam() end
	if event:GetName() == "teamplay_round_start" then updateTeam() end
	if event:GetName() == "round_officially_ended" then updateTeam() end
	if event:GetName() == "teamchange_pending" then updateTeam() end
	if event:GetName() == "jointeam_failed" then updateTeam() end
	if event:GetName() == "player_death" then updateTeam() end
	if event:GetName() == "cs_win_panel_round" then updateTeam() end
end)

client.AllowListener("cs_win_panel_round")
client.AllowListener("player_death")
client.AllowListener("jointeam_failed")
client.AllowListener("teamchange_pending")
client.AllowListener("round_officially_ended")
client.AllowListener("teamplay_round_start")
client.AllowListener("round_prestart")
client.AllowListener("round_poststart")
client.AllowListener("round_start")
client.AllowListener("round_end")
