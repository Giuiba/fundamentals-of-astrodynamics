stk.v.9.0
WrittenBy    STK_v9.0.0

BEGIN ReportStyle

BEGIN ClassId
	Class		Chain
END ClassId

BEGIN Header
	StyleType		0
	Date		Yes
	Name		Yes
	DescShort		No
	DescLong		No
	YLog10		No
	Y2Log10		No
	VerticalGridLines		No
	HorizontalGridLines		No
	AnnotationType		Spaced
	NumAnnotations		3
	NumAngularAnnotations		5
	AnnotationRotation		1
	BackgroundColor		#ffffff
	ViewableDuration		3600.000000
	RealTimeMode		No
	DayLinesStatus		1
	LegendStatus		1

BEGIN PostProcessor
	Destination	0
	Use	0
	Destination	1
	Use	0
	Destination	2
	Use	0
	Destination	3
	Use	0
END PostProcessor
	NumSections		1
END Header

BEGIN Section
	Name		Section 1
	ClassName		Chain
	NameInTitle		No
	ExpandMethod		0
	PropMask		2
	ShowIntervals		No
	NumIntervals		0
	NumLines		1

BEGIN Line
	Name		Line 1
	NumElements		18

BEGIN Element
	Name		Time
	IsIndepVar		Yes
	IndepVarName		Time
	Title		Time
	NameInTitle		No
	Service		LinkInfo
	Element		Time
	SumAllowedMask		0
	SummaryOnly		No
	DataType		0
	UnitType		2
	LineStyle		0
	LineWidth		0
	LineColor		#000000
	PointStyle		0
	PointSize		0
	PointColor		#000000
	FillPattern		0
	FillColor		#000000
	PropMask		0
	UseScenUnits		Yes
END Element

BEGIN Element
	Name		Link Information-Xmtr Power
	IsIndepVar		No
	IndepVarName		Time
	Title		Xmtr Power
	NameInTitle		Yes
	Service		LinkInfo
	Element		Xmtr Power
	SumAllowedMask		31
	SummaryOnly		No
	DataType		0
	UnitType		9
	LineStyle		0
	LineWidth		0
	LineColor		#000000
	PointStyle		0
	PointSize		0
	PointColor		#000000
	FillPattern		0
	FillColor		#000000
	PropMask		0
	UseScenUnits		Yes
END Element

BEGIN Element
	Name		Link Information-Xmtr Azimuth
	IsIndepVar		No
	IndepVarName		Time
	Title		Xmtr Azimuth
	NameInTitle		Yes
	Service		LinkInfo
	Element		Xmtr Azimuth
	SumAllowedMask		31
	SummaryOnly		No
	DataType		0
	UnitType		20
	LineStyle		0
	LineWidth		0
	LineColor		#000000
	PointStyle		0
	PointSize		0
	PointColor		#000000
	FillPattern		0
	FillColor		#000000
	PropMask		0
	UseScenUnits		No
BEGIN Units
		DistanceUnit		Meters
		TimeUnit		Seconds
		DateFormat		EpochSeconds
		AngleUnit		Radians
		MassUnit		Kilograms
		PowerUnit		Watts
		FrequencyUnit		Hertz
		SmallDistanceUnit		Meters
		LatitudeUnit		Radians
		LongitudeUnit		Degrees
		DurationUnit		Seconds
		Temperature		Kelvin
		SmallTimeUnit		Seconds
		RatioUnit		Units
		RcsUnit		SquareMeters
		DopplerVelocityUnit		MetersperSecond
		SARTimeResProdUnit		Meter-Second
		ForceUnit		Newtons
		PressureUnit		Pascals
		SpecificImpulseUnit		Seconds
		PRFUnit		Hertz
		BandwidthUnit		Hertz
		SmallVelocityUnit		MetersperSecond
		Percent		UnitValue
		MissionModelerDistanceUnit		Meters
		MissionModelerTimeUnit		Seconds
		MissionModelerAltitudeUnit		Meters
		MissionModelerFuelQuantityUnit		Kilograms
		MissionModelerRunwayLengthUnit		Meters
		MissionModelerBearingAngleUnit		Radians
		MissionModelerAngleOfAttackUnit		Radians
		MissionModelerAttitudeAngleUnit		Radians
		MissionModelerGUnit		StandardSeaLevelG
		SolidAngle		Steradians
		MissionModelerTSFCUnit		TSFCKgSecN
		MissionModelerPSFCUnit		PSFCKgSecW
		MissionModelerForceUnit		Newtons
		MissionModelerPowerUnit		FlightWatt
		SpectralBandwidthUnit		Hertz
		BitsUnit		Bits
		MagneticFieldUnit		Tesla
END Units
END Element

BEGIN Element
	Name		Link Information-Xmtr Elevation
	IsIndepVar		No
	IndepVarName		Time
	Title		Xmtr Elevation
	NameInTitle		Yes
	Service		LinkInfo
	Element		Xmtr Elevation
	SumAllowedMask		31
	SummaryOnly		No
	DataType		0
	UnitType		3
	LineStyle		0
	LineWidth		0
	LineColor		#000000
	PointStyle		0
	PointSize		0
	PointColor		#000000
	FillPattern		0
	FillColor		#000000
	PropMask		0
	UseScenUnits		No
BEGIN Units
		DistanceUnit		Meters
		TimeUnit		Seconds
		DateFormat		EpochSeconds
		AngleUnit		Degrees
		MassUnit		Kilograms
		PowerUnit		Watts
		FrequencyUnit		Hertz
		SmallDistanceUnit		Meters
		LatitudeUnit		Radians
		LongitudeUnit		Radians
		DurationUnit		Seconds
		Temperature		Kelvin
		SmallTimeUnit		Seconds
		RatioUnit		Units
		RcsUnit		SquareMeters
		DopplerVelocityUnit		MetersperSecond
		SARTimeResProdUnit		Meter-Second
		ForceUnit		Newtons
		PressureUnit		Pascals
		SpecificImpulseUnit		Seconds
		PRFUnit		Hertz
		BandwidthUnit		Hertz
		SmallVelocityUnit		MetersperSecond
		Percent		UnitValue
		MissionModelerDistanceUnit		Meters
		MissionModelerTimeUnit		Seconds
		MissionModelerAltitudeUnit		Meters
		MissionModelerFuelQuantityUnit		Kilograms
		MissionModelerRunwayLengthUnit		Meters
		MissionModelerBearingAngleUnit		Radians
		MissionModelerAngleOfAttackUnit		Radians
		MissionModelerAttitudeAngleUnit		Radians
		MissionModelerGUnit		StandardSeaLevelG
		SolidAngle		Steradians
		MissionModelerTSFCUnit		TSFCKgSecN
		MissionModelerPSFCUnit		PSFCKgSecW
		MissionModelerForceUnit		Newtons
		MissionModelerPowerUnit		FlightWatt
		SpectralBandwidthUnit		Hertz
		BitsUnit		Bits
		MagneticFieldUnit		Tesla
END Units
END Element

BEGIN Element
	Name		Link Information-Xmtr Gain
	IsIndepVar		No
	IndepVarName		Time
	Title		Xmtr Gain
	NameInTitle		Yes
	Service		LinkInfo
	Element		Xmtr Gain
	SumAllowedMask		31
	SummaryOnly		No
	DataType		0
	UnitType		24
	LineStyle		0
	LineWidth		0
	LineColor		#000000
	PointStyle		0
	PointSize		0
	PointColor		#000000
	FillPattern		0
	FillColor		#000000
	PropMask		0
	UseScenUnits		Yes
END Element

BEGIN Element
	Name		Link Information-Carrier Power at Rcvr Input
	IsIndepVar		No
	IndepVarName		Time
	Title		Carrier Power at Rcvr Input
	NameInTitle		Yes
	Service		LinkInfo
	Element		Carrier Power at Rcvr Input
	SumAllowedMask		31
	SummaryOnly		No
	DataType		0
	UnitType		9
	LineStyle		0
	LineWidth		0
	LineColor		#000000
	PointStyle		0
	PointSize		0
	PointColor		#000000
	FillPattern		0
	FillColor		#000000
	PropMask		0
	UseScenUnits		Yes
END Element

BEGIN Element
	Name		Link Information-Rcvd. Iso. Power
	IsIndepVar		No
	IndepVarName		Time
	Title		Rcvd. Iso. Power
	NameInTitle		Yes
	Service		LinkInfo
	Element		Rcvd. Iso. Power
	SumAllowedMask		31
	SummaryOnly		No
	DataType		0
	UnitType		9
	LineStyle		0
	LineWidth		0
	LineColor		#000000
	PointStyle		0
	PointSize		0
	PointColor		#000000
	FillPattern		0
	FillColor		#000000
	PropMask		0
	UseScenUnits		Yes
END Element

BEGIN Element
	Name		Link Information-Rcvd. Frequency
	IsIndepVar		No
	IndepVarName		Time
	Title		Rcvd. Frequency
	NameInTitle		Yes
	Service		LinkInfo
	Element		Rcvd. Frequency
	SumAllowedMask		31
	SummaryOnly		No
	DataType		0
	UnitType		10
	LineStyle		0
	LineWidth		0
	LineColor		#000000
	PointStyle		0
	PointSize		0
	PointColor		#000000
	FillPattern		0
	FillColor		#000000
	PropMask		0
	UseScenUnits		Yes
END Element

BEGIN Element
	Name		Link Information-Rcvr Azimuth
	IsIndepVar		No
	IndepVarName		Time
	Title		Rcvr Azimuth
	NameInTitle		Yes
	Service		LinkInfo
	Element		Rcvr Azimuth
	SumAllowedMask		31
	SummaryOnly		No
	DataType		0
	UnitType		20
	LineStyle		0
	LineWidth		0
	LineColor		#000000
	PointStyle		0
	PointSize		0
	PointColor		#000000
	FillPattern		0
	FillColor		#000000
	PropMask		0
	UseScenUnits		No
BEGIN Units
		DistanceUnit		Meters
		TimeUnit		Seconds
		DateFormat		EpochSeconds
		AngleUnit		Radians
		MassUnit		Kilograms
		PowerUnit		Watts
		FrequencyUnit		Hertz
		SmallDistanceUnit		Meters
		LatitudeUnit		Radians
		LongitudeUnit		Degrees
		DurationUnit		Seconds
		Temperature		Kelvin
		SmallTimeUnit		Seconds
		RatioUnit		Units
		RcsUnit		SquareMeters
		DopplerVelocityUnit		MetersperSecond
		SARTimeResProdUnit		Meter-Second
		ForceUnit		Newtons
		PressureUnit		Pascals
		SpecificImpulseUnit		Seconds
		PRFUnit		Hertz
		BandwidthUnit		Hertz
		SmallVelocityUnit		MetersperSecond
		Percent		UnitValue
		MissionModelerDistanceUnit		Meters
		MissionModelerTimeUnit		Seconds
		MissionModelerAltitudeUnit		Meters
		MissionModelerFuelQuantityUnit		Kilograms
		MissionModelerRunwayLengthUnit		Meters
		MissionModelerBearingAngleUnit		Radians
		MissionModelerAngleOfAttackUnit		Radians
		MissionModelerAttitudeAngleUnit		Radians
		MissionModelerGUnit		StandardSeaLevelG
		SolidAngle		Steradians
		MissionModelerTSFCUnit		TSFCKgSecN
		MissionModelerPSFCUnit		PSFCKgSecW
		MissionModelerForceUnit		Newtons
		MissionModelerPowerUnit		FlightWatt
		SpectralBandwidthUnit		Hertz
		BitsUnit		Bits
		MagneticFieldUnit		Tesla
END Units
END Element

BEGIN Element
	Name		Link Information-Rcvr Elevation
	IsIndepVar		No
	IndepVarName		Time
	Title		Rcvr Elevation
	NameInTitle		Yes
	Service		LinkInfo
	Element		Rcvr Elevation
	SumAllowedMask		31
	SummaryOnly		No
	DataType		0
	UnitType		3
	LineStyle		0
	LineWidth		0
	LineColor		#000000
	PointStyle		0
	PointSize		0
	PointColor		#000000
	FillPattern		0
	FillColor		#000000
	PropMask		0
	UseScenUnits		No
BEGIN Units
		DistanceUnit		Meters
		TimeUnit		Seconds
		DateFormat		EpochSeconds
		AngleUnit		Degrees
		MassUnit		Kilograms
		PowerUnit		Watts
		FrequencyUnit		Hertz
		SmallDistanceUnit		Meters
		LatitudeUnit		Radians
		LongitudeUnit		Radians
		DurationUnit		Seconds
		Temperature		Kelvin
		SmallTimeUnit		Seconds
		RatioUnit		Units
		RcsUnit		SquareMeters
		DopplerVelocityUnit		MetersperSecond
		SARTimeResProdUnit		Meter-Second
		ForceUnit		Newtons
		PressureUnit		Pascals
		SpecificImpulseUnit		Seconds
		PRFUnit		Hertz
		BandwidthUnit		Hertz
		SmallVelocityUnit		MetersperSecond
		Percent		UnitValue
		MissionModelerDistanceUnit		Meters
		MissionModelerTimeUnit		Seconds
		MissionModelerAltitudeUnit		Meters
		MissionModelerFuelQuantityUnit		Kilograms
		MissionModelerRunwayLengthUnit		Meters
		MissionModelerBearingAngleUnit		Radians
		MissionModelerAngleOfAttackUnit		Radians
		MissionModelerAttitudeAngleUnit		Radians
		MissionModelerGUnit		StandardSeaLevelG
		SolidAngle		Steradians
		MissionModelerTSFCUnit		TSFCKgSecN
		MissionModelerPSFCUnit		PSFCKgSecW
		MissionModelerForceUnit		Newtons
		MissionModelerPowerUnit		FlightWatt
		SpectralBandwidthUnit		Hertz
		BitsUnit		Bits
		MagneticFieldUnit		Tesla
END Units
END Element

BEGIN Element
	Name		Link Information-Rcvr Gain
	IsIndepVar		No
	IndepVarName		Time
	Title		Rcvr Gain
	NameInTitle		Yes
	Service		LinkInfo
	Element		Rcvr Gain
	SumAllowedMask		31
	SummaryOnly		No
	DataType		0
	UnitType		24
	LineStyle		0
	LineWidth		0
	LineColor		#000000
	PointStyle		0
	PointSize		0
	PointColor		#000000
	FillPattern		0
	FillColor		#000000
	PropMask		0
	UseScenUnits		Yes
END Element

BEGIN Element
	Name		Link Information-Bandwidth
	IsIndepVar		No
	IndepVarName		Time
	Title		Bandwidth
	NameInTitle		Yes
	Service		LinkInfo
	Element		Bandwidth
	SumAllowedMask		31
	SummaryOnly		No
	DataType		0
	UnitType		45
	LineStyle		0
	LineWidth		0
	LineColor		#000000
	PointStyle		0
	PointSize		0
	PointColor		#000000
	FillPattern		0
	FillColor		#000000
	PropMask		0
	UseScenUnits		Yes
END Element

BEGIN Element
	Name		Link Information-C/N
	IsIndepVar		No
	IndepVarName		Time
	Title		C/N
	NameInTitle		Yes
	Service		LinkInfo
	Element		C/N
	SumAllowedMask		31
	SummaryOnly		No
	DataType		0
	UnitType		24
	LineStyle		0
	LineWidth		0
	LineColor		#000000
	PointStyle		0
	PointSize		0
	PointColor		#000000
	FillPattern		0
	FillColor		#000000
	PropMask		0
	UseScenUnits		Yes
END Element

BEGIN Element
	Name		Link Information-C/No
	IsIndepVar		No
	IndepVarName		Time
	Title		C/No
	NameInTitle		Yes
	Service		LinkInfo
	Element		C/No
	SumAllowedMask		31
	SummaryOnly		No
	DataType		0
	UnitType		57
	LineStyle		0
	LineWidth		0
	LineColor		#000000
	PointStyle		0
	PointSize		0
	PointColor		#000000
	FillPattern		0
	FillColor		#000000
	PropMask		0
	UseScenUnits		Yes
END Element

BEGIN Element
	Name		Link Information-Eb/No
	IsIndepVar		No
	IndepVarName		Time
	Title		Eb/No
	NameInTitle		Yes
	Service		LinkInfo
	Element		Eb/No
	SumAllowedMask		31
	SummaryOnly		No
	DataType		0
	UnitType		24
	LineStyle		0
	LineWidth		0
	LineColor		#000000
	PointStyle		0
	PointSize		0
	PointColor		#000000
	FillPattern		0
	FillColor		#000000
	PropMask		0
	UseScenUnits		Yes
END Element

BEGIN Element
	Name		Link Information-Flux Density
	IsIndepVar		No
	IndepVarName		Time
	Title		Flux Density
	NameInTitle		Yes
	Service		LinkInfo
	Element		Flux Density
	SumAllowedMask		31
	SummaryOnly		No
	DataType		0
	UnitType		56
	LineStyle		0
	LineWidth		0
	LineColor		#000000
	PointStyle		0
	PointSize		0
	PointColor		#000000
	FillPattern		0
	FillColor		#000000
	PropMask		0
	UseScenUnits		Yes
END Element

BEGIN Element
	Name		Link Information-g/T
	IsIndepVar		No
	IndepVarName		Time
	Title		g/T
	NameInTitle		Yes
	Service		LinkInfo
	Element		g/T
	SumAllowedMask		31
	SummaryOnly		No
	DataType		0
	UnitType		58
	LineStyle		0
	LineWidth		0
	LineColor		#000000
	PointStyle		0
	PointSize		0
	PointColor		#000000
	FillPattern		0
	FillColor		#000000
	PropMask		0
	UseScenUnits		Yes
END Element

BEGIN Element
	Name		Link Information-BER
	IsIndepVar		No
	IndepVarName		Time
	Title		BER
	NameInTitle		Yes
	Service		LinkInfo
	Element		BER
	Format		%.6E
	SumAllowedMask		31
	SummaryOnly		No
	DataType		0
	UnitType		6
	LineStyle		0
	LineWidth		0
	LineColor		#000000
	PointStyle		0
	PointSize		0
	PointColor		#000000
	FillPattern		0
	FillColor		#000000
	PropMask		0
BEGIN Event
	UseEvent		No
	EventValue		0.000000
	Direction		Both
	CreateFile		No
END Event
	UseScenUnits		Yes
END Element
END Line
END Section
END ReportStyle

