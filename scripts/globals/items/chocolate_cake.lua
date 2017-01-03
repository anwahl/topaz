-----------------------------------------
-- ID: 5633
-- Item: Chocolate Cake
-- Food Effect: 3 Hrs, All Races
-----------------------------------------
-- TODO: Group Effect
-- MP +3% (cap 90)
-- HP Recovered while healing +1
-- MP Recovered while healing +6
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
result = 0
    if (target:hasStatusEffect(EFFECT_FOOD) == true or target:hasStatusEffect(EFFECT_FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addStatusEffect(EFFECT_FOOD,0,0,10800,5633);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_FOOD_MPP, 3);
    target:addMod(MOD_FOOD_MP_CAP, 90);
    target:addMod(MOD_HPHEAL, 1);
    target:addMod(MOD_MPHEAL, 6);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_FOOD_MPP, 3);
    target:delMod(MOD_FOOD_MP_CAP, 90);
    target:delMod(MOD_HPHEAL, 1);
    target:delMod(MOD_MPHEAL, 6);
end;
