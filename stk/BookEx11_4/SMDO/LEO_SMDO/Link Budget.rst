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
	NumElements		4

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
	Name		Link Information-EIRP
	IsIndepVar		No
	IndepVarName		Time
	Title		EIRP
	NameInTitle		Yes
	Service		LinkInfo
	Element		EIRP
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
	Name		Link Information-BER
	IsIndepVar		No
	IndepVarName		Time
	Title		BER
	NameInTitle		Yes
	Service		LinkInfo
	Element		BER
	Format		%.6e
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

