function using(pkgn) file.Write( "\\using/json.lua", http.Get( "https://raw.githubusercontent.com/G-A-Development-Team/libs/main/json.lua" ) ) LoadScript("\\using/json.lua") local pkg = json.decode(http.Get("https://raw.githubusercontent.com/G-A-Development-Team/Using/main/using.json"))["pkgs"][ pkgn ] if pkg ~= nil then file.Write( "\\using/" .. pkgn .. ".lua", http.Get( pkg ) ) LoadScript("\\using/" .. pkgn .. ".lua") else print("[using] package doesn't exist. {" .. pkgn .. "}") end end
local Tab = gui.Tab(gui.Reference("Misc"), "Carter-Team-Selector", "Carter's Team Selector")
local autoTeam = gui.Combobox(Tab, "autoTeam", "Select team to auto join", "Terrorist", "Counter-Terrorist")
local lastValueTeam = autoTeam:GetValue()
using "SwitchTeamAPI"
local function updateTeam()
	if entities.GetLocalPlayer() == nil then return end
	local LocalPlayer = entities.GetLocalPlayer()
	if autoTeam:GetValue() == 0 then if LocalPlayer:GetTeamNumber() ~= 2 then client.Command("jointeam 2", false) end end
	if autoTeam:GetValue() == 1 then if LocalPlayer:GetTeamNumber() ~= 3 then client.Command("jointeam 3", false) end end end
callbacks.Register("Draw", function() SwitchTeamCallback = updateTeam() if lastValueTeam ~= autoTeam:GetValue() then lastValueTeam = autoTeam:GetValue() updateTeam() end end)
