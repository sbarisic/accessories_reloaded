/*
Hey you! You are reading my code!
I want to say that my code is far from perfect, and if you see that I'm doing something
in a really wrong/dumb way, please give me advices instead of saying "LOL U BAD CODER"
        Thanks
      - MadJawa
*/
TOOL.Category		= "(MadJawa)";
TOOL.Name			= "Laser 2.0";
TOOL.Command		= nil;
TOOL.ConfigName		= "";

if ( CLIENT ) then
	language.Add( "tool.laseremitter.name", "Laser Spawner" );
	language.Add( "tool.laseremitter.desc", "Spawn a very dangerous laser. Do not look into beam with remaining eye!" );
	language.Add( "tool.laseremitter.0", "Left click to create/update a laser where you are aiming, right click on a laser to make it ignore an entity" );
	language.Add( "tool.laseremitter.1", "Now click on the entity you want the laser to ignore, or click on the world if you want it to ignore you" );
	language.Add( "Cleanup_laseremitters", "Lasers");
	language.Add( "Cleaned_laseremitters", "Cleaned up all Lasers");
	language.Add( "SBoxLimit_laseremitters", "You've hit Laser limit!" );
	language.Add( "Undone_laseremitter", "Undone Laser" );
end

if (SERVER) then
	CreateConVar("sbox_maxlaseremitters", 20);
end

TOOL.ClientConVar[ "key" ] = "5";
TOOL.ClientConVar[ "width" ] = "4";
TOOL.ClientConVar[ "length" ] = "30000";
TOOL.ClientConVar[ "damage" ] = "2500";
TOOL.ClientConVar[ "material" ] = "cable/physbeam";
TOOL.ClientConVar[ "model" ] = "models/props_combine/headcrabcannister01a_skybox.mdl";
TOOL.ClientConVar[ "dissolvetype" ] = "core";
TOOL.ClientConVar[ "startsound" ] = "ambient/energy/weld1.wav";
TOOL.ClientConVar[ "stopsound" ] = "ambient/energy/weld2.wav";
TOOL.ClientConVar[ "killsound" ] = "ambient/levels/citadel/weapon_disintegrate1.wav";
TOOL.ClientConVar[ "toggle" ] = "0";
TOOL.ClientConVar[ "starton" ] = "0";
TOOL.ClientConVar[ "pushprops" ] = "1";
TOOL.ClientConVar[ "endingeffect" ] = "1";
TOOL.ClientConVar[ "worldweld" ] = "0";
TOOL.ClientConVar[ "angleoffset" ] = "270";
TOOL.ClientConVar[ "startoffset" ] = "1.5";


list.Set( "LaserEmitterModels", "models/props_combine/headcrabcannister01a_skybox.mdl", { laseremitter_angleoffset = 270, laseremitter_startoffset = 1.5 } );
list.Set( "LaserEmitterModels", "models/props_combine/breenlight.mdl", { laseremitter_angleoffset = 180, laseremitter_startoffset = -2 } );
list.Set( "LaserEmitterModels", "models/props_junk/flare.mdl", { laseremitter_angleoffset = 0, laseremitter_startoffset = -0.5 } );
list.Set( "LaserEmitterModels", "models/props_lab/tpplug.mdl", { laseremitter_angleoffset = 90, laseremitter_startoffset = 7.6 } );
list.Set( "LaserEmitterModels", "models/props_junk/TrafficCone001a.mdl", { laseremitter_angleoffset = 0, laseremitter_startoffset = -0.5 } );
list.Set( "LaserEmitterModels", "models/props_junk/PopCan01a.mdl", { laseremitter_angleoffset = 0, laseremitter_startoffset = -0.3 } );

if util.IsValidModel('models/jaanus/wiretool/wiretool_beamcaster.mdl') then
	list.Set( "LaserEmitterModels", "models/jaanus/wiretool/wiretool_beamcaster.mdl", { laseremitter_angleoffset = 0, laseremitter_startoffset = -0.2 } );
end


list.Set( "LaserEmitterMaterials", {}, "cable/redlaser" );
list.Set( "LaserEmitterMaterials", {}, "cable/physbeam" );
list.Set( "LaserEmitterMaterials", {}, "cable/xbeam" );
list.Set( "LaserEmitterMaterials", {}, "cable/blue_elec" );
list.Set( "LaserEmitterMaterials", {}, "cable/hydra" );
list.Set( "LaserEmitterMaterials", {}, "cable/crystal_beam1" );


if ( CLIENT ) then
	language.Add( "DissolveType_Energy", "AR2 style" );
	language.Add( "DissolveType_HeavyElectric", "Heavy electrical" );
	language.Add( "DissolveType_LightElectric", "Light electrical" );
	language.Add( "DissolveType_Core", "Core Effect" );
end

list.Set( "LaserDissolveTypes", "#DissolveType_Energy", { laseremitter_dissolvetype = "energy" } );
list.Set( "LaserDissolveTypes", "#DissolveType_HeavyElectric", { laseremitter_dissolvetype = "heavyelec" } );
list.Set( "LaserDissolveTypes", "#DissolveType_LightElectric", { laseremitter_dissolvetype = "lightelec" } );
list.Set( "LaserDissolveTypes", "#DissolveType_Core", { laseremitter_dissolvetype = "core" } );


if ( CLIENT ) then	
	language.Add( "Sound_None", "None" );
	language.Add( "Sound_AlyxEMP", "Alyx EMP" );
	language.Add( "Sound_Weld1", "Weld 1" );
	language.Add( "Sound_Weld2", "Weld 2" );
	language.Add( "Sound_ElectricExplosion1", "Electric Explosion 1" );
	language.Add( "Sound_ElectricExplosion2", "Electric Explosion 2" );
	language.Add( "Sound_ElectricExplosion3", "Electric Explosion 3" );
	language.Add( "Sound_ElectricExplosion4", "Electric Explosion 4" );
	language.Add( "Sound_ElectricExplosion5", "Electric Explosion 5" );
	language.Add( "Sound_Disintegrate1", "Disintegrate 1" );
	language.Add( "Sound_Disintegrate2", "Disintegrate 2" );
	language.Add( "Sound_Disintegrate3", "Disintegrate 3" );
	language.Add( "Sound_Disintegrate4", "Disintegrate 4" );
	language.Add( "Sound_Zapper", "Zapper" );
end

list.Set( "LaserSounds", "#Sound_None", ""  );
list.Set( "LaserSounds", "#Sound_AlyxEMP", "AlyxEMP.Charge" );
list.Set( "LaserSounds", "#Sound_Weld1", "ambient/energy/weld1.wav" );
list.Set( "LaserSounds", "#Sound_Weld2", "ambient/energy/weld2.wav" );
list.Set( "LaserSounds", "#Sound_ElectricExplosion1", "ambient/levels/labs/electric_explosion1.wav" );
list.Set( "LaserSounds", "#Sound_ElectricExplosion2", "ambient/levels/labs/electric_explosion2.wav" );
list.Set( "LaserSounds", "#Sound_ElectricExplosion3", "ambient/levels/labs/electric_explosion3.wav" );
list.Set( "LaserSounds", "#Sound_ElectricExplosion4", "ambient/levels/labs/electric_explosion4.wav" );
list.Set( "LaserSounds", "#Sound_ElectricExplosion5", "ambient/levels/labs/electric_explosion5.wav" );
list.Set( "LaserSounds", "#Sound_Disintegrate1", "ambient/levels/citadel/weapon_disintegrate1.wav" );
list.Set( "LaserSounds", "#Sound_Disintegrate2", "ambient/levels/citadel/weapon_disintegrate2.wav" );
list.Set( "LaserSounds", "#Sound_Disintegrate3", "ambient/levels/citadel/weapon_disintegrate3.wav" );
list.Set( "LaserSounds", "#Sound_Disintegrate4", "ambient/levels/citadel/weapon_disintegrate4.wav" );
list.Set( "LaserSounds", "#Sound_Zapper", "ambient/levels/citadel/zapper_warmup1.wav" );

for k,v in pairs(list.Get("LaserSounds")) do
	list.Set( "LaserStartSounds", k, { laseremitter_startsound = v }  );
	list.Set( "LaserStopSounds", k, { laseremitter_stopsound = v }  );
	list.Set( "LaserKillSounds", k, { laseremitter_killsound = v }  );
end


cleanup.Register( "laseremitters" );



function TOOL:LeftClick( trace )
	if ( not trace.HitPos ) then return false; end
	
	if ( trace.Entity:IsPlayer() ) then return false; end
	
	if ( SERVER and not util.IsValidPhysicsObject( trace.Entity, trace.PhysicsBone ) ) then return false; end
	
	if ( CLIENT ) then return true; end

	local ply = self:GetOwner();

	local key = self:GetClientNumber( "key" );
	local width = self:GetClientNumber( "width" );
	local length = self:GetClientNumber( "length" );
	local damage = self:GetClientNumber( "damage" );
	local material = self:GetClientInfo( "material" );
	local model = self:GetClientInfo( "model" );
	local dissolveType = self:GetClientInfo( "dissolvetype" );
	local startSound = self:GetClientInfo( "startsound" );
	local stopSound = self:GetClientInfo( "stopsound" );
	local killSound = self:GetClientInfo( "killsound" );
	local toggle = self:GetClientNumber( "toggle" ) == 1;
	local startOn = self:GetClientNumber( "starton" ) == 1;
	local pushProps = self:GetClientNumber( "pushprops" ) == 1;
	local endingEffect = self:GetClientNumber( "endingeffect" ) == 1;
	local worldWeld = self:GetClientNumber( "worldweld" ) == 1;
	local angleOffset = self:GetClientNumber( "angleoffset" );
	local startOffset = self:GetClientNumber( "startoffset" );
	
	if ( trace.Entity:IsValid() and trace.Entity:GetClass() == "gmod_laser" ) then
		trace.Entity:Setup( width, length, damage, material, dissolveType, startSound, stopSound, killSound, toggle, startOn, pushProps, endingEffect, true );
		return true;
	end

	if ( not self:GetSWEP():CheckLimit( "laseremitters" ) ) then return false; end

	local Ang = trace.HitNormal:Angle();
	Ang.pitch = Ang.pitch + 90 - angleOffset;
	
	local laser = MakeLaserEmitter(	ply, trace.HitPos, Ang, model, angleOffset, startOffset, key, width, length, damage, material,
									dissolveType, startSound, stopSound, killSound, toggle, startOn, pushProps, endingEffect );

	local min = laser:OBBMins();
	laser:SetPos( trace.HitPos - trace.HitNormal * min.z );
	
	if ( ( trace.Entity:IsValid() and util.IsValidPhysicsObject( trace.Entity, trace.PhysicsBone ) ) or worldWeld ) then
		local const = constraint.Weld( laser, trace.Entity, 0, trace.PhysicsBone, 0, true );
	end

	undo.Create( "LaserEmitter" );
		undo.AddEntity( laser );
		undo.AddEntity( const );
		undo.SetPlayer( ply );
	undo.Finish();

	ply:AddCleanup( "laseremitters", laser );

	return true;
end



function TOOL:RightClick( trace )
	if ( not trace.HitPos ) then return false; end
	
	if ( trace.Entity:IsPlayer() ) then return false; end
			
	if ( CLIENT ) then return true; end
	
	if (self:GetStage() == 0 and (trace.Entity:GetClass() == "gmod_laser" or trace.Entity:GetClass() == "gmod_laser_crystal") ) then
		self.LaserEnt = trace.Entity;
		self:SetStage(1);
	elseif (self:GetStage() == 1 and trace.Entity ~= self.LaserEnt) then
		self.LaserEnt.IgnoreList = self.LaserEnt.IgnoreList or {};
		
		if not trace.Entity:IsValid() then ignoredEnt = self:GetOwner();
		else ignoredEnt = trace.Entity; end
		
		if not table.HasValue(self.LaserEnt.IgnoreList, ignoredEnt) then
			table.insert(self.LaserEnt.IgnoreList, ignoredEnt);
		else
			for k,v in pairs(self.LaserEnt.IgnoreList) do
				if (v == ignoredEnt) then table.remove(self.LaserEnt.IgnoreList, k); end
			end
		end
		
		-- we send the ignore list to the client to display the beam properly
		umsg.Start("Laser.UpdateIgnoreList", RecipientFilter():AddAllPlayers());
			-- sending the entities index instead of entities themselves to reduce the length of the umsg (is it the right way to do this?)
			umsg.Long(self.LaserEnt:EntIndex());
			umsg.Long(#self.LaserEnt.IgnoreList);
			for i=1, #self.LaserEnt.IgnoreList do
				umsg.Long(self.LaserEnt.IgnoreList[i]:EntIndex());
			end
		umsg.End();
		
		if not ignoredEnt:IsPlayer() then DoPropSpawnedEffect(ignoredEnt); end
		
		self:SetStage(0);
	else return false; end

	return true;
end



if (SERVER) then

	function MakeLaserEmitter(	ply, pos, ang, model, angleOffset, startOffset, key, width, length, damage, material, dissolveType,
								startSound, stopSound, killSound, toggle, startOn, pushProps, endingEffect, Vel, aVel, frozen )

		if ( not ply:CheckLimit( "laseremitters" ) ) then return false; end
	
		local laser = ents.Create( "gmod_laser" )
		if ( not laser:IsValid() ) then return false; end

		laser:SetAngles( ang );
		laser:SetPos( pos );
		laser:SetModel( Model(model) );
		laser:SetAngleOffset( angleOffset );
		laser:SetStartOffset( startOffset );
		
		laser:Spawn();
		
		laser:Setup( width, length, damage, material, dissolveType, startSound, stopSound, killSound, toggle, startOn, pushProps, endingEffect, false );
		
		numpad.OnDown( ply, key, "Laser_On", laser );
		numpad.OnUp( ply, key, "Laser_Off", laser );

		local ttable = {
			ply = ply,
			key = key,
			width = width,
			length = length,
			damage = damage,
			material = material,
			dissolveType = dissolveType,
			startSound = startSound,
			stopSound = stopSound,
			killSound = killSound,
			toggle = toggle,
			startOn = startOn,
			pushProps = pushProps,
			endingEffect = endingEffect,
			angleOffset = angleOffset,
			startOffset = startOffset
		}
		table.Merge( laser:GetTable(), ttable );
				
		ply:AddCount( "laseremitters", laser );
		
		DoPropSpawnedEffect(laser);

		return laser;

	end
	
	duplicator.RegisterEntityClass(	"gmod_laser", MakeLaserEmitter, "pos", "ang", "model", "angleOffset", "startOffset", "key", "width", "length",
									"damage", "material", "dissolveType", "startSound", "stopSound", "killSound", "toggle", "startOn",
									"pushProps", "endingEffect", "Vel", "aVel", "frozen");

end



function TOOL:UpdateGhostLaserEmitter( ent, player )
	if ( not ent or not ent:IsValid() ) then return; end

	local tr = util.GetPlayerTrace( player, player:GetAimVector() );
	local trace = util.TraceLine( tr );

	if ( not trace.Hit or trace.Entity:IsPlayer() or trace.Entity:GetClass() == "gmod_laser" or self:GetStage() == 1 ) then
		ent:SetNoDraw( true );
		return;
	end

	local Ang = trace.HitNormal:Angle();
	Ang.pitch = Ang.pitch + 90 - self:GetClientNumber( "angleoffset" );

	local min = ent:OBBMins();
	ent:SetPos( trace.HitPos - trace.HitNormal * min.z );
	ent:SetAngles( Ang );

	ent:SetNoDraw( false );
end



function TOOL:Think()
	if ( not self.GhostEntity or not self.GhostEntity:IsValid() or self.GhostEntity:GetModel() ~= self:GetClientInfo( "Model" ) ) then
		self:MakeGhostEntity( self:GetClientInfo( "Model" ), Vector( 0, 0, 0 ), Angle( 0, 0, 0) );
	end

	self:UpdateGhostLaserEmitter( self.GhostEntity, self:GetOwner() );
end



function TOOL.BuildCPanel(panel)
	panel:AddControl("Header", { Text = "#Tool_laseremitter_name", Description = "#Tool_laseremitter_desc" });
	
 	local params = { Label = "#Presets", MenuButton = 1, Folder = "laseremitter", Options = {}, CVars = {} };
 		 
 		params.Options.default = { 
 			laseremitter_width			= 4,
 			laseremitter_length			= 30000,
 			laseremitter_damage			= 2500,
 			laseremitter_material		= "cable/physbeam",
 			laseremitter_model			= "models/props_combine/headcrabcannister01a_skybox.mdl",
 			laseremitter_dissolvetype	= "core",
 			laseremitter_startsound		= "ambient/energy/weld1.wav",
			laseremitter_stopsound		= "ambient/energy/weld2.wav",
			laseremitter_killsound		= "ambient/levels/citadel/weapon_disintegrate1.wav",
			laseremitter_toggle			= 0,
			laseremitter_starton		= 0,
			laseremitter_pushprops		= 1,
			laseremitter_endingeffect	= 1,
			laseremitter_worldweld		= 0,
			laseremitter_angleoffset	= 270,
			laseremitter_startoffset	= 1.5
 		}
 			 
 		table.insert( params.CVars, "laseremitter_width" );
 		table.insert( params.CVars, "laseremitter_length" );
 		table.insert( params.CVars, "laseremitter_damage" );
 		table.insert( params.CVars, "laseremitter_material" );
 		table.insert( params.CVars, "laseremitter_model" );
 		table.insert( params.CVars, "laseremitter_dissolvetype" );
 		table.insert( params.CVars, "laseremitter_startsound" );
		table.insert( params.CVars, "laseremitter_stopsound" );
		table.insert( params.CVars, "laseremitter_killsound" );
		table.insert( params.CVars, "laseremitter_toggle" );
		table.insert( params.CVars, "laseremitter_starton" );
		table.insert( params.CVars, "laseremitter_pushprops" );
		table.insert( params.CVars, "laseremitter_endingeffect" );
		table.insert( params.CVars, "laseremitter_worldweld" );
		table.insert( params.CVars, "laseremitter_angleoffset" );
		table.insert( params.CVars, "laseremitter_startoffset" );
 		 
 	panel:AddControl( "ComboBox", params );

	
	panel:AddControl( "Numpad", {	Label = "Key:",
									Command = "laseremitter_key",
									ButtonSize = 22 } );
	
	panel:AddControl( "Slider", { 	Label = "Width:",
									Type = "Integer",
									Min = 1,
									Max = 20,
									Command = "laseremitter_width" } );

	panel:AddControl( "Slider", { 	Label = "Length:",
									Type = "Integer",
									Min = 0,
									Max = 30000,
									Command = "laseremitter_length" } );
									
	panel:AddControl( "Slider", { 	Label = "Damage:",
									Type = "Integer",
									Min = 0,
									Max = 2500,
									Command = "laseremitter_damage" } );
									
	panel:AddControl( "MatSelect", {	Label = "Material:",
										Height = 1,
										ItemWidth = 24, 
										ItemHeight = 64, 
										ConVar = "laseremitter_material",
										Options = list.Get( "LaserEmitterMaterials" ) } );
	
	panel:AddControl( "PropSelect", {	Label = "Model:",
										ConVar = "laseremitter_model",
										Models = list.Get( "LaserEmitterModels" ) } );

	panel:AddControl( "Label", { Text = "Dissolve type:" } );
 	panel:AddControl( "ComboBox", {	Label = "Dissolve type:",
									MenuButton = "0",
									Command = "laseremitter_dissolvetype",
									Options = list.Get( "LaserDissolveTypes" ) } );

	panel:AddControl( "Label", { Text = "Start sound:" } );
 	panel:AddControl( "ComboBox", {	Label = "Start sound:",
									MenuButton = "0",
									Command = "laseremitter_startsound",
									Options = list.Get( "LaserStartSounds" ) } );
									
	panel:AddControl( "Label", { Text = "Stop sound:" } );
 	panel:AddControl( "ComboBox", {	Label = "Stop sound:",
									MenuButton = "0",
									Command = "laseremitter_stopsound",
									Options = list.Get( "LaserStopSounds" ) } );
									
	panel:AddControl( "Label", { Text = "Kill sound:" } );
 	panel:AddControl( "ComboBox", {	Label = "Kill sound:",
									MenuButton = "0",
									Command = "laseremitter_killsound",
									Options = list.Get( "LaserKillSounds" ) } );

	panel:AddControl( "CheckBox", {	Label = "Toggle",
									Command = "laseremitter_toggle" } );
									
	panel:AddControl( "CheckBox", {	Label = "Start On",
									Command = "laseremitter_starton" } );
									
	panel:AddControl( "CheckBox", {	Label = "Push props",
									Command = "laseremitter_pushprops" } );

	panel:AddControl( "CheckBox", {	Label = "Ending effect",
									Command = "laseremitter_endingeffect" } );

	panel:AddControl( "CheckBox", {	Label = "Weld to world",
									Command = "laseremitter_worldweld" } );
	
end