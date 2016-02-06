local function run(msg, matches, media)
if msg.to.type == 'chat' then
    if is_owner(msg) then
        return
    end
    local data = load_data(_config.moderation.data)
    if data[tostring(msg.to.id)] then
        if data[tostring(msg.to.id)]['settings'] then
            if data[tostring(msg.to.id)]['settings']['lock_gif'] then
                lock_gif = data[tostring(msg.to.id)]['settings']['lock_gif']
            end
        end
    end
    local chat = get_receiver(msg)
    local user = "user#id"..msg.from.id
    if lock_gif == "yes" then
        send_large_msg(chat, gif is not allowed here!!')
        chat_del_user(chat, user, ok_cb, true)
    end
end
 end
return {
	usage = {
		"lock gif : If User Send A Message With gif Then Bot Removed User.",
		"unlock gif : No Action Execute If User Send Mesage With gif",
		},
  patterns = {
    "media",
	"[Gg]if",
	"tgservice"
  },
  run = run
}
