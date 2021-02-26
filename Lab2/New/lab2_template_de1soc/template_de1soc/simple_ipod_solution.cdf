/* Quartus II 64-Bit Version 14.1.0 Build 186 12/03/2014 SJ Web Edition */
JedecChain;
	FileRevision(JESD32A);
	DefaultMfr(6E);

	P ActionCode(Cfg)
		Device PartName(5CSEMA5F31) Path("C:/Users/pedri/OneDrive/UBC/3 Year/Cpen 311/Labs/Lab2/New/backup_speed_done/template_de1soc/") File("simple_ipod_solution.sof") MfrSpec(OpMask(1));
	P ActionCode(Ign)
		Device PartName(5CSEMA5F31) MfrSpec(OpMask(0) SEC_Device(EPCS128) Child_OpMask(1 0) FullPath("C:/Users/pedri/OneDrive/UBC/3 Year/Cpen 311/Labs/Lab2/New/lab2_template_de1soc/template_de1soc/simple_ipod_solution.sof"));

ChainEnd;

AlteraBegin;
	ChainType(JTAG);
AlteraEnd;
