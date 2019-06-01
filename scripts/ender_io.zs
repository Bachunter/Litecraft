// --- Created by Miha_77 ---



// --- Imports ---
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDictEntry;
import mods.tconstruct.Casting;
import mods.enderio.AlloySmelter;
import mods.gregtech.recipe.RecipeMap;



// --- Variables ---
var benitoite = <bigreactors:mineralbenitoite>;
var anglesite = <bigreactors:mineralanglesite>;
var glass_cable = <appliedenergistics2:part:16>;

var hv_machine_hull = <gregtech:machine:503>;
var small_battery_lithium = <gregtech:meta_item_1:32518>;
var motor_lv = <gregtech:meta_item_1:32600>;
var robot_arm_lv = <gregtech:meta_item_1:32650>;
var conveyor_lv = <gregtech:meta_item_1:32630>;

var mold_block = <gregtech:meta_item_1:32308>;

var dynamite = <gregtech:meta_item_1:32629>;

val list_items = [
  <enderio:item_item_conduit>, <enderio:item_liquid_conduit>, <enderio:item_liquid_conduit:1>, <enderio:item_liquid_conduit:2>, <enderio:item_power_conduit>, 
  <enderio:item_power_conduit:1>, <enderio:item_power_conduit:2>, <enderio:item_redstone_conduit>, <enderio:item_me_conduit>, <enderio:item_me_conduit:1>
] as IItemStack[];

val crafting_item_list_ore_dict = [
  <ore:nuggetPulsatingIron>, <ore:fusedGlass>, <ore:fusedQuartz>
] as IOreDictEntry[];

val crafting_item_list = [
  <ore:wireGtDoubleConductiveIron>, <ore:wireGtDoubleEnergeticAlloy>, <ore:wireGtDoubleVibrantAlloy>, <ore:wireGtDoubleRedstoneAlloy>
] as IOreDictEntry[];




// --- Remove Recipes ---

for e in list_items {
  recipes.remove(e);
}

// --- Solar Panels
recipes.remove(<enderio:block_solar_panel:1>);
recipes.remove(<enderio:block_solar_panel:2>);
recipes.remove(<enderio:block_solar_panel:3>);

// --- Dual-wings
recipes.remove(<enderio:item_material:6>);

// --- Wing remake
recipes.remove(<enderio:item_material:7>);

// --- Basic Capasitor Bank
recipes.remove(<enderio:block_cap_bank:1>);

// --- Flour
recipes.remove(<enderio:item_material:21>);

// --- Pulsating Crystall
recipes.remove(<enderio:item_material:14>);
Casting.removeTableRecipe(<enderio:item_material:14>);

// --- Vibrant Crystall
recipes.remove(<enderio:item_material:15>);
Casting.removeTableRecipe(<enderio:item_material:15>);

// --- Simple Machine Chassis
recipes.remove(<enderio:item_material>);

// --- Industrial Machine Chassis
recipes.remove(<enderio:item_material:1>);

// --- Soul Machine Chassis
recipes.remove(<enderio:item_material:53>);

// --- Enhanced Machine Chassis
recipes.remove(<enderio:item_material:54>);

// --- End Steel Chassis
recipes.remove(<enderio:item_material:66>);

// --- Electrical Steel
furnace.remove(<ore:ingotElectricalSteel>);

// --- Energetic Alloy
furnace.remove(<ore:ingotEnergeticAlloy>);

// --- Vibrant Alloy
furnace.remove(<ore:ingotVibrantAlloy>);

// --- Pulsating Iron
furnace.remove(<ore:ingotPulsatingIron>);

// --- Dark Steel
furnace.remove(<ore:ingotDarkSteel>);

// --- Soularium
furnace.remove(<ore:ingotSoularium>);

// --- End Steel
furnace.remove(<ore:ingotEndSteel>);

// --- Confusion Charge
recipes.remove(<enderio:block_confusion_charge>);

// --- Ender Charge
recipes.remove(<enderio:block_ender_charge>);

// --- Concussion Charge
recipes.remove(<enderio:block_concussion_charge>);

// --- Simple Powered Furnace
recipes.remove(<enderio:block_simple_furnace>);

// --- Simple Alloy Smelter
recipes.remove(<enderio:block_simple_alloy_smelter>);

// --- Simple Striling Generator
recipes.remove(<enderio:block_simple_stirling_generator>);

// --- Simple SAG Mill
recipes.remove(<enderio:block_simple_sag_mill>);

// --- Simple Wired Charger
recipes.remove(<enderio:block_simple_wired_charger>);

// --- Simple Crafter
recipes.remove(<enderio:block_simple_crafter>);




// --- Added Recipes ---
for i, conduit in list_items {
  if(i < 3){
    recipes.addShaped(conduit * 4, 
      [[<ore:itemConduitBinder>, <ore:itemConduitBinder>, <ore:itemConduitBinder>], 
      [crafting_item_list_ore_dict[i], crafting_item_list_ore_dict[i], crafting_item_list_ore_dict[i]], 
      [<ore:itemConduitBinder>, <ore:itemConduitBinder>, <ore:itemConduitBinder>]]);
  } else if (i == 3) {
    recipes.addShaped(conduit * 4, 
      [[<ore:itemConduitBinder>, <ore:itemConduitBinder>, <ore:itemConduitBinder>], 
      [crafting_item_list_ore_dict[i - 1], crafting_item_list[i - 1], crafting_item_list_ore_dict[i - 1]], 
      [<ore:itemConduitBinder>, <ore:itemConduitBinder>, <ore:itemConduitBinder>]]);
  } else if (i >= 4 && i < 8) {
    recipes.addShaped(conduit * 4, 
      [[<ore:itemConduitBinder>, <ore:itemConduitBinder>, <ore:itemConduitBinder>], 
      [crafting_item_list[i - 4], crafting_item_list[i - 4], crafting_item_list[i - 4]], 
      [<ore:itemConduitBinder>, <ore:itemConduitBinder>, <ore:itemConduitBinder>]]);
  } else if (i == 8) {
    recipes.addShaped(conduit * 4, 
      [[<ore:itemConduitBinder>, <ore:itemConduitBinder>, <ore:itemConduitBinder>], 
      [glass_cable, glass_cable, glass_cable], 
      [<ore:itemConduitBinder>, <ore:itemConduitBinder>, <ore:itemConduitBinder>]]);
  } else {
    recipes.addShaped(conduit * 4, 
      [[<ore:itemConduitBinder>, <enderio:item_me_conduit>, <ore:itemConduitBinder>], 
      [<enderio:item_me_conduit>, <ore:itemConduitBinder>, <enderio:item_me_conduit>], 
      [<ore:itemConduitBinder>, <enderio:item_me_conduit>, <ore:itemConduitBinder>]]);
  }
}


// --- Simple Machines 

// --- Simple Powered Furnace
recipes.addShaped(<enderio:block_simple_furnace>, 
[[<ore:plateConstructionAlloy>, <ore:craftingFurnace>, <ore:plateConstructionAlloy>], 
[<ore:cableGtSingleTin>, <ore:itemSimpleMachineChassi>, <ore:cableGtSingleTin>], 
[<ore:gearStone>, <ore:craftingFurnace>, <ore:gearStone>]]);

// --- Simple Alloy Smelter
recipes.addShaped(<enderio:block_simple_alloy_smelter>, 
[[<ore:wireGtDoubleCopper>, <ore:cableGtSingleTin>, <ore:wireGtDoubleCopper>], 
[<ore:craftingFurnace>, <ore:itemSimpleMachineChassi>, <ore:craftingFurnace>], 
[<ore:gearStone>, <ore:cableGtSingleTin>, <ore:gearStone>]]);

// --- Simple Striling Generator
recipes.addShaped(<enderio:block_simple_stirling_generator>, 
[[<ore:stickCopper>, <ore:plateConstructionAlloy>, <ore:stickCopper>], 
[<ore:stickIronMagnetic>, <ore:itemSimpleMachineChassi>, <ore:stickIronMagnetic>], 
[<ore:gearStone>, motor_lv, <ore:gearStone>]]);

// --- Simple SAG Mill
recipes.addShaped(<enderio:block_simple_sag_mill>, 
[[<ore:gemDiamond>, <ore:craftingPiston>, <ore:gemDiamond>], 
[<ore:cableGtSingleTin>, <ore:itemSimpleMachineChassi>, <ore:cableGtSingleTin>], 
[<ore:gearStone>, <ore:craftingPiston>, <ore:gearStone>]]);

// --- Simple Wired Charger
recipes.addShaped(<enderio:block_simple_wired_charger>, 
[[<ore:cableGtDoubleConstructionAlloy>, <ore:cableGtSingleTin>, <ore:cableGtDoubleConstructionAlloy>], 
[<ore:cableGtSingleTin>, <ore:itemSimpleMachineChassi>, <ore:cableGtSingleTin>], 
[<ore:gearStone>, <ore:cableGtSingleTin>, <ore:gearStone>]]);

// --- Simple Crafter
recipes.addShaped(<enderio:block_simple_crafter>, 
[[robot_arm_lv, <ore:cableGtSingleTin>, robot_arm_lv], 
[conveyor_lv, <ore:itemSimpleMachineChassi>, conveyor_lv], 
[<ore:gearStone>, <avaritia:compressed_crafting_table>, <ore:gearStone>]]);


// --- Dual-wings remake
//recipes.addShaped(<enderio:item_material:6>, [[null, <rustic:tallow>, <minecraft:leather>], [<rustic:tallow>, <minecraft:leather>, <minecraft:leather>], [<minecraft:leather>, <minecraft:leather>, <minecraft:leather>]]);

// --- Wing remake
//recipes.addShaped(<enderio:item_material:7>, [[null, <ore:ingotSteel>, null], [<enderio:item_material:6>, <ore:ingotSteel>, <enderio:item_material:6>]]);

// --- Basic Capasitor Bank
recipes.addShaped(<enderio:block_cap_bank:1>, [[null, <ore:ingotConductiveIron>, null], [small_battery_lithium, hv_machine_hull, small_battery_lithium], [<enderio:item_basic_capacitor>, <ore:ingotConductiveIron>, <enderio:item_basic_capacitor>]]);

// --- Simple Machine Chassis
recipes.addShaped(<enderio:item_material>, [[<ore:plateConstructionAlloy>, <ore:plateConstructionAlloy>, <ore:plateConstructionAlloy>], [<ore:plateConstructionAlloy>, <ore:dustBedrock>, <ore:plateConstructionAlloy>], [<ore:plateConstructionAlloy>, <ore:plateConstructionAlloy>, <ore:plateConstructionAlloy>]]);

// --- Industrial Machine Chassis
recipes.addShaped(<enderio:item_material:1>, [[<ore:plateStainlessSteel>, <ore:plateStainlessSteel>, <ore:plateStainlessSteel>], [<ore:plateStainlessSteel>, <ore:dyeMachine>, <ore:plateStainlessSteel>], [<ore:plateStainlessSteel>, <ore:plateStainlessSteel>, <ore:plateStainlessSteel>]]);

// --- Soul Machine Chassis
recipes.addShaped(<enderio:item_material:53>, [[<ore:plateSoularium>, <ore:plateSoularium>, <ore:plateSoularium>], [<ore:plateSoularium>, <ore:dyeSoulMachine>, <ore:plateSoularium>], [<ore:plateSoularium>, <ore:plateSoularium>, <ore:plateSoularium>]]);

// --- Enhanced Machine Chassis
recipes.addShaped(<enderio:item_material:54>, [[<ore:plateTitanium>, <ore:plateTitanium>, <ore:plateTitanium>], [<ore:plateTitanium>, <ore:dyeEnhancedMachine>, <ore:plateTitanium>], [<ore:plateTitanium>, <ore:plateTitanium>, <ore:plateTitanium>]]);

// --- End Steel Chassis
recipes.addShaped(<enderio:item_material:66>, [[<ore:plateEndSteel>, <ore:plateEndSteel>, <ore:plateEndSteel>], [<ore:plateEndSteel>, <ore:dustBedrock>, <ore:plateEndSteel>], [<ore:plateEndSteel>, <ore:plateEndSteel>, <ore:plateEndSteel>]]);


// --- Assembler Recipes ---
val assembler = RecipeMap.getByName("alloy_smelter");

// --- Confusion Charge
assembler.recipeBuilder()
    .duration(400).EUt(120)
    .inputs(<ore:plateWood> * 6)
    .inputs(dynamite)
    .inputs(<ore:dustGunpowder> * 2)
    .inputs(<ore:itemConfusingDust> * 8)
    .fluidInputs(<liquid:glue> * 300)
    .outputs(<enderio:block_confusion_charge>)
    .buildAndRegister();

// --- Ender Charge
assembler.recipeBuilder()
    .duration(400).EUt(120)
    .inputs(<ore:plateWood> * 6)
    .inputs(dynamite)
    .inputs(<ore:dustGunpowder> * 2)
    .inputs(<ore:itemEnderFragment> * 4)
    .fluidInputs(<liquid:glue> * 300)
    .outputs(<enderio:block_ender_charge>)
    .buildAndRegister();

// --- Concussion Charge
assembler.recipeBuilder()
    .duration(400).EUt(120)
    .inputs(<ore:plateWood> * 6)
    .inputs(<ore:platePaper> * 2)
    .inputs(<ore:dustGunpowder> * 4)
    .inputs(<ore:itemConfusingDust> * 3)
    .inputs(<ore:itemEnderFragment> * 3)
    .fluidInputs(<liquid:glue> * 300)
    .outputs(<enderio:block_concussion_charge>)
    .buildAndRegister();

// --- Alloy Smelter Recipes ---
val alloy_smelter = RecipeMap.getByName("alloy_smelter");

// --- Construcion Alloy
alloy_smelter.recipeBuilder()
    .duration(200).EUt(16)
    .inputs(<ore:dustTinAlloy> * 8)
    .inputs(<ore:dustSilicon>)
    .outputs(<enderio:item_alloy_ingot:9> * 9)
    .buildAndRegister();
//-
alloy_smelter.recipeBuilder()
    .duration(200).EUt(16)
    .inputs(<ore:ingotTinAlloy> * 8)
    .inputs(<ore:ingotSilicon>)
    .outputs(<enderio:item_alloy_ingot:9> * 9)
    .buildAndRegister();
//-
alloy_smelter.recipeBuilder()
    .duration(200).EUt(16)
    .inputs(<ore:ingotTinAlloy> * 8)
    .inputs(<ore:dustSilicon>)
    .outputs(<enderio:item_alloy_ingot:9> * 9)
    .buildAndRegister();
//-
alloy_smelter.recipeBuilder()
    .duration(200).EUt(16)
    .inputs(<ore:dustTinAlloy> * 8)
    .inputs(<ore:ingotSilicon>)
    .outputs(<enderio:item_alloy_ingot:9> * 9)
    .buildAndRegister();

// --- Fused Quartz
alloy_smelter.recipeBuilder()
    .duration(200).EUt(16)
    .inputs(<ore:dustQuartz> * 4)
    .notConsumable(mold_block)
    .outputs(<enderio:block_fused_quartz>)
    .buildAndRegister();
// -
alloy_smelter.recipeBuilder()
    .duration(300).EUt(16)
    .inputs(<ore:gemQuartz> * 4)
    .notConsumable(mold_block)
    .outputs(<enderio:block_fused_quartz>)
    .buildAndRegister();
// -
alloy_smelter.recipeBuilder()
    .duration(400).EUt(24)
    .inputs(<ore:blockNetherQuartz>)
    .notConsumable(mold_block)
    .outputs(<enderio:block_fused_quartz>)
    .buildAndRegister();

// --- Enlightened Fused Quartz

alloy_smelter.recipeBuilder()
    .duration(400).EUt(24)
    .inputs(<ore:gemQuartz> * 4)
    .inputs(<ore:glowstone>)
    .outputs(<enderio:block_enlightened_fused_quartz>)
    .buildAndRegister();
// - 
alloy_smelter.recipeBuilder()
    .duration(400).EUt(24)
    .inputs(<ore:dustQuartz> * 4)
    .inputs(<ore:dustGlowstone> * 4)
    .outputs(<enderio:block_enlightened_fused_quartz>)
    .buildAndRegister();
// - 
alloy_smelter.recipeBuilder()
    .duration(400).EUt(24)
    .inputs(<ore:gemQuartz> * 4)
    .inputs(<ore:glowstone>)
    .outputs(<enderio:block_enlightened_fused_quartz>)
    .buildAndRegister();
// - 
alloy_smelter.recipeBuilder()
    .duration(400).EUt(24)
    .inputs(<ore:dustQuartz> * 4)
    .inputs(<ore:glowstone>)
    .outputs(<enderio:block_enlightened_fused_quartz>)
    .buildAndRegister();
// - 
alloy_smelter.recipeBuilder()
    .duration(400).EUt(24)
    .inputs(<enderio:block_fused_quartz>)
    .inputs(<ore:glowstone>)
    .outputs(<enderio:block_enlightened_fused_quartz>)
    .buildAndRegister();
// - 
alloy_smelter.recipeBuilder()
    .duration(400).EUt(24)
    .inputs(<enderio:block_fused_quartz>)
    .inputs(<ore:dustGlowstone> * 4)
    .outputs(<enderio:block_enlightened_fused_quartz>)
    .buildAndRegister();
// - 
alloy_smelter.recipeBuilder()
    .duration(400).EUt(24)
    .inputs(<ore:blockNetherQuartz>)
    .inputs(<ore:dustGlowstone> * 4)
    .outputs(<enderio:block_enlightened_fused_quartz>)
    .buildAndRegister();
// - 
alloy_smelter.recipeBuilder()
    .duration(400).EUt(24)
    .inputs(<ore:blockNetherQuartz>)
    .inputs(<ore:glowstone>)
    .outputs(<enderio:block_enlightened_fused_quartz>)
    .buildAndRegister();















