main()
{
	self.pers["PROMOD_CACHE_SUNLIGHT"] = get_config( "PROMOD_SUNLIGHT" );
	self.pers["PROMOD_CACHE_TEXTURE"] = get_config( "PROMOD_TEXTURE" );
	self.pers["PROMOD_CACHE_FILMTWEAK"] = get_config( "PROMOD_FILMTWEAK" );
	self.pers["PROMOD_CACHE_FOVSCALE"] = get_config( "PROMOD_FOVSCALE" );
	self.pers["PROMOD_CACHE_NORMALMAP"] = get_config( "PROMOD_NORMALMAP" );
	self.pers["PROMOD_CACHE_GFXBLUR"] = get_config( "PROMOD_GFXBLUR" );
	self.pers["PROMOD_CACHE_FIRSTTIME"] = get_config( "PROMOD_FIRSTTIME" );

	self use_config();
}

get_config( dataName )
{
	return self getStat( int( tableLookup( "promod/customStatsTable.csv", 1, dataName, 0 ) ) );
}

set_config( dataName, value )
{
	self setStat( int( tableLookup( "promod/customStatsTable.csv", 1, dataName, 0 ) ), value );
	self use_config();
}

toggle_sunlight()
{
	if ( self.pers["PROMOD_CACHE_SUNLIGHT"] == 0 )
		self.pers["PROMOD_CACHE_SUNLIGHT"] = 1;
	else if ( self.pers["PROMOD_CACHE_SUNLIGHT"] == 1 )
		self.pers["PROMOD_CACHE_SUNLIGHT"] = 2;
	else
		self.pers["PROMOD_CACHE_SUNLIGHT"] = 0;

	self set_config( "PROMOD_SUNLIGHT", self.pers["PROMOD_CACHE_SUNLIGHT"] );
}

toggle_filmtweak()
{
	if ( self.pers["PROMOD_CACHE_FILMTWEAK"] == 0 )
		self.pers["PROMOD_CACHE_FILMTWEAK"] = 1;
	else
		self.pers["PROMOD_CACHE_FILMTWEAK"] = 0;

	self set_config( "PROMOD_FILMTWEAK", self.pers["PROMOD_CACHE_FILMTWEAK"] );
}

toggle_fovscale()
{
	if ( self.pers["PROMOD_CACHE_FOVSCALE"] == 0 )
		self.pers["PROMOD_CACHE_FOVSCALE"] = 1;
	else
		self.pers["PROMOD_CACHE_FOVSCALE"] = 0;

	self set_config( "PROMOD_FOVSCALE", self.pers["PROMOD_CACHE_FOVSCALE"] );
}

toggle_texture()
{
	if ( self.pers["PROMOD_CACHE_TEXTURE"] == 0 )
		self.pers["PROMOD_CACHE_TEXTURE"] = 1;
	else
		self.pers["PROMOD_CACHE_TEXTURE"] = 0;

	self set_config( "PROMOD_TEXTURE", self.pers["PROMOD_CACHE_TEXTURE"] );
}

toggle_normalmap()
{
	if ( self.pers["PROMOD_CACHE_NORMALMAP"] == 0 )
		self.pers["PROMOD_CACHE_NORMALMAP"] = 1;
	else
		self.pers["PROMOD_CACHE_NORMALMAP"] = 0;

	self set_config( "PROMOD_NORMALMAP", self.pers["PROMOD_CACHE_NORMALMAP"] );
}

toggle_gfxblur()
{
	if ( self.pers["PROMOD_CACHE_GFXBLUR"] < 5 )
		self.pers["PROMOD_CACHE_GFXBLUR"]++;
	else
		self.pers["PROMOD_CACHE_GFXBLUR"] = 0;

	self set_config( "PROMOD_GFXBLUR", self.pers["PROMOD_CACHE_GFXBLUR"] );
}

use_config()
{
	if ( self.pers["PROMOD_CACHE_SUNLIGHT"] == 0 )
	{
		self setClientDvars( "r_lighttweaksunlight", 1.2,
							 "sunlight", "1.2" );
	}
	else if ( self.pers["PROMOD_CACHE_SUNLIGHT"] == 1 )
	{
		 if ( getDvar( "mapname" ) == "mp_backlot" )
			self setClientDvar( "r_lighttweaksunlight", 1.3 );
		else if ( getDvar( "mapname" ) == "mp_bloc" )
			self setClientDvar( "r_lighttweaksunlight", 0.9 );
		else if ( getDvar( "mapname" ) == "mp_bog" )
			self setClientDvar( "r_lighttweaksunlight", 0.8 );
		else if ( getDvar( "mapname" ) == "mp_broadcast" )
			self setClientDvar( "r_lighttweaksunlight", 1.4 );
		else if ( getDvar( "mapname" ) == "mp_carentan" )
			self setClientDvar( "r_lighttweaksunlight", 0.75 );
		else if ( getDvar( "mapname" ) == "mp_cargoship" )
			self setClientDvar( "r_lighttweaksunlight", 1.3 );
		else if ( getDvar( "mapname" ) == "mp_citystreets" )
			self setClientDvar( "r_lighttweaksunlight", 0.78 );
		else if ( getDvar( "mapname" ) == "mp_convoy" )
			self setClientDvar( "r_lighttweaksunlight", 1.6 );
		else if ( getDvar( "mapname" ) == "mp_countdown" )
			self setClientDvar( "r_lighttweaksunlight", 1.5 );
		else if ( getDvar( "mapname" ) == "mp_crash" )
			self setClientDvar( "r_lighttweaksunlight", 1.3 );
		else if ( getDvar( "mapname" ) == "mp_crash_snow" )
			self setClientDvar( "r_lighttweaksunlight", 0.25 );
		else if ( getDvar( "mapname" ) == "mp_creek" )
			self setClientDvar( "r_lighttweaksunlight", 1.5 );
		else if ( getDvar( "mapname" ) == "mp_crossfire" )
			self setClientDvar( "r_lighttweaksunlight", 1 );
		else if ( getDvar( "mapname" ) == "mp_farm" )
			self setClientDvar( "r_lighttweaksunlight", 1 );
		else if ( getDvar( "mapname" ) == "mp_killhouse" )
			self setClientDvar( "r_lighttweaksunlight", 1.5 );
		else if ( getDvar( "mapname" ) == "mp_overgrown" )
			self setClientDvar( "r_lighttweaksunlight", 1.1 );
		else if ( getDvar( "mapname" ) == "mp_pipeline" )
			self setClientDvar( "r_lighttweaksunlight", 1.15 );
		else if ( getDvar( "mapname" ) == "mp_shipment" )
			self setClientDvar( "r_lighttweaksunlight", 1.3 );
		else if ( getDvar( "mapname" ) == "mp_showdown" )
			self setClientDvar( "r_lighttweaksunlight", 1.6 );
		else if ( getDvar( "mapname" ) == "mp_strike" )
			self setClientDvar( "r_lighttweaksunlight", 1 );
		else if ( getDvar( "mapname" ) == "mp_vacant" )
			self setClientDvar( "r_lighttweaksunlight", 1.3 );
		else
			self setClientDvar( "r_lighttweaksunlight", 1 );

		self setClientDvar("sunlight", "Stock");
	}
	else
		self setClientDvars( "r_lighttweaksunlight", 0,
							 "sunlight", "Off" );

	if ( self.pers["PROMOD_CACHE_FOVSCALE"] == 0 )
		self setClientDvar( "cg_fovscale", 1.125 );
	else
		self setClientDvar( "cg_fovscale", 1 );

	if ( self.pers["PROMOD_CACHE_NORMALMAP"] == 0 )
		self setClientDvar( "r_normalmap", 0 );
	else
		self setClientDvar( "r_normalmap", 1 );

	if ( self.pers["PROMOD_CACHE_GFXBLUR"] == 0 )
		self setClientDvar( "r_blur", 0 );
	else if ( self.pers["PROMOD_CACHE_GFXBLUR"] == 1 )
		self setClientDvar( "r_blur", 0.2 );
	else if ( self.pers["PROMOD_CACHE_GFXBLUR"] == 2 )
		self setClientDvar( "r_blur", 0.4 );
	else if ( self.pers["PROMOD_CACHE_GFXBLUR"] == 3 )
		self setClientDvar( "r_blur", 0.6 );
	else if ( self.pers["PROMOD_CACHE_GFXBLUR"] == 4 )
		self setClientDvar( "r_blur", 0.8 );
	else if ( self.pers["PROMOD_CACHE_GFXBLUR"] == 5 )
		self setClientDvar( "r_blur", 1 );

	if ( self.pers["PROMOD_CACHE_FIRSTTIME"] == 0 )
	{
		self.pers["PROMOD_CACHE_FIRSTTIME"] = 1;
		self set_config( "PROMOD_FIRSTTIME", 1 );
	}

	self setClientDvar( "r_texfilterdisable", self.pers["PROMOD_CACHE_TEXTURE"] );
	self setClientDvar( "r_filmusetweaks", self.pers["PROMOD_CACHE_FILMTWEAK"] );
}