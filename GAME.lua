local lplr = game:GetService("Players").LocalPlayer
function shootAt(cf)
	for i, v in next, lplr.Character:GetChildren() do
		if v:IsA("Tool") and v.Name ~= "Shotty" then
			v.Parent = lplr.Backpack
		end
	end
	if not lplr.Character:FindFirstChild("Shotty") and lplr.Character ~= nil then
		lplr.Backpack:WaitForChild("Shotty").Parent = lplr.Character
		lplr.Backpack:WaitForChild("ServerTraits").Tool:FireServer(lplr.Character:WaitForChild("Shotty"))
		task.wait(0.24)
		lplr.Character.Shotty.Shoot:FireServer(cf)
		task.wait(.24)
		lplr.Character.Shotty.Shoot:FireServer(cf)
		task.wait(.24)
		lplr.Character.Shotty.Shoot:FireServer(cf)
	end
	lplr.Character.Shotty.Shoot:FireServer(cf)
end
local hosts = {
    "JunkifyMaster",
    "your2ndusernamehere"
}
local triggerbotting = {
	a=false;
	b=nil;
}
local enabled = false
local angle = 0
local speed = 9
for i, v in next, hosts do
    if lplr.Name == v then return end
    for i, v in next, workspace:GetDescendants() do
        if v.ClassName:lower():find("seat") then v:Destroy() end
    end
end
for i, v in next, game:GetService("Players"):GetPlayers() do
    for index, string in next, hosts do
        if v["Name"] == string and string ~= lplr.Name then
            v.Chatted:Connect(function(msg)
            	local split = {}
            	if msg:find(" ") then
            		split = msg:split(" ")
            	end
                if msg:lower() == ".bring all" then
                    lplr.Character:PivotTo(v.Character.HumanoidRootPart.CFrame + v.Character.HumanoidRootPart.CFrame.LookVector * 5)
                end
                if msg:lower() == ".re all" then
                    lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Dead)
                    lplr.Character.Head:Destroy()
                end
 				if split[1]:lower() == ".bring" and lplr.Name:lower():find(split[2]:lower()) or split[2]:lower():find(lplr.Name:lower()) then
                	lplr.Character:PivotTo(v.Character.HumanoidRootPart.CFrame + v.Character.HumanoidRootPart.CFrame.LookVector * 5)
                end
                if split[1]:lower() == ".re" and lplr.Name:lower():find(split[2]:lower()) or split[2]:lower():find(lplr.Name:lower()) then
                    lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Dead)
                    lplr.Character.Head:Destroy()
                    lplr.CharacterAdded:Wait()
                end
                if split[1]:lower() == ".rejoin" and lplr.Name:lower():find(split[2]:lower()) or split[2]:lower():find(lplr.Name:lower()) then
                    game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId)
                end
                if split[1]:lower() == ".test" and lplr.Name:lower():find(split[2]:lower()) or split[2]:lower():find(lplr.Name:lower()) or split[1]:lower() == ".test all" then
                	shootAt(CFrame.new(0, 9e9, 0))
                    game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest"):FireServer("TEST", "All")
                end
                if split[1]:lower() == ".rejoin" then
                	game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId)
                end
                if split[1]:lower() == ".untb" then
                	enabled = false
                end
                if split[1]:lower() == ".tb" then
                	for _,v in next, game:GetService("Players"):GetPlayers() do
                		if v:IsA("Player") and v ~= lplr then
                			if (split[2]:lower():find(v.Name:lower()) or v.Name:lower():find(split[2]:lower())) and v.Character ~= nil and v.Character:FindFirstChild("Humanoid") and v.Character:FindFirstChild("HumanoidRootPart") then
                				enabled = true
                				local dist = 9
                				local name = v.Name
                				coroutine.wrap(function() spawn(function()
                					while enabled == true and game:GetService("Players"):FindFirstChild(name) do
                						triggerbotting.b = v
                						if not v.Character then v.CharacterAdded:wait() end
                						if not v.Character:FindFirstChild("HumanoidRootPart") then repeat task.wait(1 / 9e9) until v.Character:FindFirstChild("HumanoidRootPart") end
										if not v.Character:FindFirstChild("Humanoid") then repeat task.wait(1 / 9e9) until v.Character:FindFirstChild("Humanoid") end
										if v.Character:FindFirstChild("Humanoid").Health <= 5 then dist = 3 else dist = 9 end
										angle = angle + speed
										if angle > 360 then angle = 0 else angle = angle + speed end
										lplr.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(angle), 0) * CFrame.new(0, 0, dist)
										shootAt(v.Character.HumanoidRootPart.CFrame + (v.Character.HumanoidRootPart.Velocity * 0.129327))
										game:GetService("RunService").Heartbeat:wait()
                					end
                					triggerbotting.b = nil
                				end) end)()
                			end
                		end
                	end
                end
            end)
        end
    end
end
game:GetService("Players").PlayerAdded:Connect(function(v)
for index, string in next, hosts do
        if v["Name"] == string and string ~= lplr.Name then
            v.Chatted:Connect(function(msg)
            	local split = {}
            	if msg:find(" ") then
            		split = msg:split(" ")
            	end
                if msg:lower() == ".bring all" then
                    lplr.Character:PivotTo(v.Character.HumanoidRootPart.CFrame + v.Character.HumanoidRootPart.CFrame.LookVector * 5)
                end
                if msg:lower() == ".re all" then
                    lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Dead)
                    lplr.Character.Head:Destroy()
                end
 				if split[1]:lower() == ".bring" and lplr.Name:lower():find(split[2]:lower()) or split[2]:lower():find(lplr.Name:lower()) then
                	lplr.Character:PivotTo(v.Character.HumanoidRootPart.CFrame + v.Character.HumanoidRootPart.CFrame.LookVector * 5)
                end
                if split[1]:lower() == ".re" and lplr.Name:lower():find(split[2]:lower()) or split[2]:lower():find(lplr.Name:lower()) then
                    lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Dead)
                    lplr.Character.Head:Destroy()
                    lplr.CharacterAdded:Wait()
                end
                if split[1]:lower() == ".test" and lplr.Name:lower():find(split[2]:lower()) or split[2]:lower():find(lplr.Name:lower()) or split[1]:lower() == ".test all" then
                	shootAt(CFrame.new(0, 9e9, 0))
                    game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest"):FireServer("TEST", "All")
                end
                if split[1]:lower() == ".untb" then
                	triggerbotting.a = false
                end
                if split[1]:lower() == ".tb" then
                	for _,v in next, game:GetService("Players"):GetPlayers() do
                		if v:IsA("Player") and v ~= lplr then
                			if (split[2]:lower():find(v.Name:lower()) or v.Name:lower():find(split[2]:lower())) and v.Character ~= nil and v.Character:FindFirstChild("Humanoid") and v.Character:FindFirstChild("HumanoidRootPart") then
                				triggerbotting.a = true
                				local dist = 9
                				coroutine.wrap(function() spawn(function()
                					while triggerbotting.a == true and v do
                						triggerbotting.b = v
                						if not v.Character then v.CharacterAdded:wait() end
                						if not v.Character:FindFirstChild("HumanoidRootPart") then repeat task.wait(1 / 9e9) until v.Character:FindFirstChild("HumanoidRootPart") end
										if not v.Character:FindFirstChild("Humanoid") then repeat task.wait(1 / 9e9) until v.Character:FindFirstChild("Humanoid") end
										if v.Character:FindFirstChild("Humanoid").Health <= 5 then dist = 3 else dist = 9 end
										angle = angle + speed
										if lplr.Character and lplr.Character:FindFirstChild("Humanoid") and lplr.Character.Humanoid:GetState() == 12 then
											lplr.Character:FindFirstChild("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
										end
										if angle > 360 then angle = 0 else angle = angle + speed end
										lplr.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(angle), 0) * CFrame.new(0, 0, dist)
										shootAt(v.Character.HumanoidRootPart.CFrame + (v.Character.HumanoidRootPart.Velocity * 0.129327))
										game:GetService("RunService").Heartbeat:wait()
                					end
                					triggerbotting.b = nil
                				end) end)()
                			end
                		end
                	end
                end
            end)
        end
    end
end)
