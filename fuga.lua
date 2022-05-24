--tempoT - tempo total;
--tempoA - tempo Ativo;
--fuga - nome da spell q o boneco solta em MINUSCULO 

local hpPercent = 50 -- % q ira bater as fugas
local fuga1, tempoT1, tempoA1 = "bijuu furie", 180000, 5000

local fuga2, tempoT2, tempoA2 = "shoton:shouton suishou douka", 60000, 5000

local fuga3, tempoT3, tempoA3 = "kawarimi no jutsu", 60000, 3000



-- don't change below
--nao mexer abaixo

if type(storage.fuga1) ~= "table" or (storage.fuga1.t - now) > tempoT1 then
    storage.fuga1 = {t = 0, a = 0}
end

if type(storage.fuga2) ~= "table" or (storage.fuga2.t - now) > tempoT2 then
    storage.fuga2 = {t = 0, a = 0}
end

if type(storage.fuga3) ~= "table" or (storage.fuga3.t - now) > tempoT3 then
    storage.fuga3 = {t = 0, a = 0}
end

onTalk(function(name, level, mode, text)
if name ~= player:getName() then return end
local text = text:lower()
if text == fuga1 and storage.fuga1.t < now then
    storage.fuga1 = {t = now + tempoT1, a = now + tempoA1}
elseif text == fuga2 and storage.fuga2.t < now then
    storage.fuga2 = {t = now + tempoT2, a = now + tempoA2}
elseif text == fuga3 and storage.fuga3.t < now then
    storage.fuga3 = {t = now + tempoT3, a = now + tempoA3}
end
end)

onCreatureHealthPercentChange(function(creature, healthPercent)
if creature ~= player then return end
local hp = healthPercent 
if hp >= hpPercent then return end
if isInPz() then return end
if storage.fuga1 and storage.fuga1.t < now then
    say(fuga1)
elseif storage.fuga2 and storage.fuga1.t > now and storage.fuga1.a < now and storage.fuga2.t < now then
    say(fuga2)
elseif storage.fuga3 and storage.fuga2.t > now and storage.fuga2.a < now and storage.fuga3.t < now then
    say(fuga3)
end
end)
