print("Welcome to the game. Type 'help' for a list of basic commands.")

input = ""

inv = {"Inventory:", "String", "A Rock To Wind The String Around", "Un-Readable Coin", "Sword"}

-- Functions
function get_inv()
for i,v in pairs(inv) do
print(v)
end
end
function bad_cmd()
print("The command you typed has come up to be invalid. Please try a different command.")
end
function get_input()
print("What do you want to do?")
input = io.read()
return input
end
function exit_game()
print("You left. Game over.")
io.read()
os.exit()
end
function help_cmd()
print("Press Enter to go to the next help command.")
io.read()
print("help - shows help")
io.read()
print("inspect - search area")
io.read()
print("inv - open inventory")
io.read()
print("exit____ - leaves area")
io.read()
print("follow ____ - get on bridge/path or follow someone")
io.read()
print("open ____ - use to open door/gate")
io.read()
print("grab ____ - pick up item")
io.read()
print("exit_game - leave game")
io.read()
print("use ____ - being implemented")
print("End of Help. Press Enter to continue game.")
io.read()
end
function add_inv(item)
table.insert(inv, item)
end
function remove_inv(item)
for i, v in pairs(inv) do
if v == item then
table.remove(inv, i)
end
end
end
function room(t)
room_exit = false
input = ""
while not room_exit do
input = get_input()
valid = false
for k,v in pairs(t) do
if input == string.gsub(k, "_", " ") then
if type(v) == "string" then
print(v)
else
v()
end
valid = true
end
end
if input == "help" then
help_cmd()
elseif input == "inv" then
get_inv()
elseif valid == false then
bad_cmd()
end
end
end
-- Functions

--In Cave
room_cmd = {inspect = "You are in a cave. There is an exit.", 
exit_cave = function()
print("You leave the cave.")
room_exit = true
end
}
room(room_cmd)
-- In Cave

--Outside Of Cave
room_cmd2 = {
inspect = "You are at the base of a hill. There is a path.", 
follow_path = function()
print("You follow the path.")
print("A goblin appears wielding a gun.")
print("What do you do? (run away, attack, nothing, random gibberish)")
fightinput = io.read()
if fightinput == "attack" then
print("You make a long, deep cut through its chest. It drops dead.")
print("Added Goblin Armor to Inventory.")
add_inv("Goblin Armor")
room_exit = true
elseif fightinput == "run away" then
print("You coward. You run but get shot in the knee, causing you to stagger and lose the coin. You get away. You are no longer and adventurer.")
remove_inv("Un-Readable Coin")
room_exit = true
else
print("You stand there and right before you die, you hear a loud voice say,'BOOM! HEADSHOT!'Game over.")
io.read()
os.exit()
end
end
}

room(room_cmd2)

--Outside Of Cave

--At Gate
have_key = false
room_cmd3 = {
inspect = function()
if have_key == false then
print("There is a gate. A key is hidden in the grass.")
else
print("There is a gate.")
end
end,
grab_key = function()
have_key = true
print("You grabbed a Thick Key.")
print("Added Thick Key to Inventory.")
add_inv("Thick Key")
end,
open_gate = function()
if have_key == false then
print("The gate is locked.")
elseif have_key == true then
print("You unlock the gate and leave. The key is destroyed. Good job. The key had a life to you know.")
remove_inv("Thick Key")
room_exit = true
end
end,
grab_magical_wand = function()
add_inv("Magical Wand")
print("You run outside, trying to combat the werecats, flailing your arms very girly with your female hands screaming the Harry Potter spell,'Peeus Hypeus!'")
end
}

room(room_cmd3)
--At Gate

--Player Wins
input = ""
while input ~= "exit" do
print("You win! Type 'exit' to leave.")
input = io.read()
if input == "exit" then
print("Goodbye!")
io.read()
os.exit()
else
print("Please type 'exit' to leave.")
end
end
--Player Wins