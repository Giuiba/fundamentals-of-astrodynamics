stk.v.9.0
WrittenBy    STK_v9.2.2

BEGIN	Transmitter

Name	Tx_dnlink
<!-- STKv4.0 Format="XML" -->
<STKOBJECT>
<OBJECT Class = "CommRadarObject" Name = "STK_Transmitter_Object">
    <OBJECT Class = "bool" Name = "Clonable"> True </OBJECT>
    <OBJECT Class = "string" Name = "Description"> &quot;STK Transmitter Object&quot; </OBJECT>
    <OBJECT Class = "link" Name = "Model">
        <OBJECT Class = "Transmitter" Name = "Complex_Transmitter_Model">
            <OBJECT Class = "AttrCon" Name = "AntennaControl">
                <OBJECT Class = "string" Name = "AntennaReferenceType"> &quot;Embed&quot; </OBJECT>
                <OBJECT Class = "link" Name = "Antenna">
                    <OBJECT Class = "Antenna" Name = "Gaussian">
                        <OBJECT Class = "double" Name = "BacklobeGain"> 0.001 units </OBJECT>
                        <OBJECT Class = "double" Name = "Beamwidth"> 0.02137050457464162 rad </OBJECT>
                        <OBJECT Class = "bool" Name = "Clonable"> True </OBJECT>
                        <OBJECT Class = "string" Name = "Description"> &quot;Analytical model of a Gaussian beam similar to a parabolic antenna within about -6 dB relative to boresight&quot; </OBJECT>
                        <OBJECT Class = "double" Name = "DesignFrequency"> 14500000000 Hz </OBJECT>
                        <OBJECT Class = "double" Name = "Diameter"> 1.2 m </OBJECT>
                        <OBJECT Class = "double" Name = "Efficiency"> 0.65 unitValue </OBJECT>
                        <OBJECT Class = "string" Name = "InputType"> &quot;Use Diameter&quot; </OBJECT>
                        <OBJECT Class = "double" Name = "MainlobeGain"> 21610.76758676165 units </OBJECT>
                        <OBJECT Class = "bool" Name = "ReadOnly"> False </OBJECT>
                        <OBJECT Class = "string" Name = "Type"> &quot;Gaussian&quot; </OBJECT>
                        <OBJECT Class = "string" Name = "UserComment"> &quot;Analytical model of a Gaussian beam similar to a parabolic antenna within about -6 dB relative to boresight&quot; </OBJECT>
                        <OBJECT Class = "string" Name = "Version"> &quot;1.0.0 a&quot; </OBJECT>
                    </OBJECT>
                </OBJECT>
                <OBJECT Class = "link" Name = "Orientation">
                    <OBJECT Class = "Orientation" Name = "Azimuth Elevation">
                        <OBJECT Class = "string" Name = "AboutBoresight"> &quot;Rotate&quot; </OBJECT>
                        <OBJECT Class = "double" Name = "AzimuthAngle"> 0 rad </OBJECT>
                        <OBJECT Class = "double" Name = "ElevationAngle"> 1.570796326794897 rad </OBJECT>
                        <OBJECT Class = "string" Name = "Type"> &quot;Azimuth Elevation&quot; </OBJECT>
                        <OBJECT Class = "double" Name = "XPositionOffset"> 0 m </OBJECT>
                        <OBJECT Class = "double" Name = "YPositionOffset"> 0 m </OBJECT>
                        <OBJECT Class = "double" Name = "ZPositionOffset"> 0 m </OBJECT>
                    </OBJECT>
                </OBJECT>
                <OBJECT Class = "link" Name = "Polarization">
                    <OBJECT Class = "Polarization" Name = "Linear">
                        <OBJECT Class = "double" Name = "CrossPolLeakage"> 1e-006 units </OBJECT>
                        <OBJECT Class = "string" Name = "ReferenceAxis"> &quot;X Axis&quot; </OBJECT>
                        <OBJECT Class = "double" Name = "TiltAngle"> 0 rad </OBJECT>
                        <OBJECT Class = "string" Name = "Type"> &quot;Linear&quot; </OBJECT>
                    </OBJECT>
                </OBJECT>
                <OBJECT Class = "bool" Name = "UsePolarization"> False </OBJECT>
            </OBJECT>
            <OBJECT Class = "bool" Name = "Clonable"> True </OBJECT>
            <OBJECT Class = "string" Name = "Description"> &quot;Complex model of a transmitter&quot; </OBJECT>
            <OBJECT Class = "link" Name = "Filter">
                <OBJECT Class = "Filter" Name = "Butterworth">
                    <OBJECT Class = "bool" Name = "Clonable"> True </OBJECT>
                    <OBJECT Class = "double" Name = "CutoffFrequency"> 10000000 Hz </OBJECT>
                    <OBJECT Class = "string" Name = "Description"> &quot;General form of nth order Butterworth filter with flat passband and stopband regions&quot; </OBJECT>
                    <OBJECT Class = "double" Name = "InsertionLoss"> 1 units </OBJECT>
                    <OBJECT Class = "double" Name = "LowerBandwidthLimit"> -20000000 Hz </OBJECT>
                    <OBJECT Class = "int" Name = "Order"> 4 </OBJECT>
                    <OBJECT Class = "bool" Name = "ReadOnly"> False </OBJECT>
                    <OBJECT Class = "string" Name = "Type"> &quot;Butterworth&quot; </OBJECT>
                    <OBJECT Class = "double" Name = "UpperBandwidthLimit"> 20000000 Hz </OBJECT>
                    <OBJECT Class = "string" Name = "UserComment"> &quot;General form of nth order Butterworth filter with flat passband and stopband regions&quot; </OBJECT>
                    <OBJECT Class = "string" Name = "Version"> &quot;1.0.0 a&quot; </OBJECT>
                </OBJECT>
            </OBJECT>
            <OBJECT Class = "double" Name = "Frequency"> 14500000000 Hz </OBJECT>
            <OBJECT Class = "link" Name = "Modulator">
                <OBJECT Class = "Modulator" Name = "Basic_Modulator">
                    <OBJECT Class = "bool" Name = "AutoScaleBandwidth"> True </OBJECT>
                    <OBJECT Class = "double" Name = "Bandwidth"> 32000000 Hz </OBJECT>
                    <OBJECT Class = "int" Name = "ChipsPerBit"> 1 </OBJECT>
                    <OBJECT Class = "bool" Name = "Clonable"> True </OBJECT>
                    <OBJECT Class = "double" Name = "DataRate"> 16000000 b*sec^-1 </OBJECT>
                    <OBJECT Class = "string" Name = "Description"> &quot;Basic Modulator&quot; </OBJECT>
                    <OBJECT Class = "double" Name = "LowerBandwidthLimit"> -16000000 Hz </OBJECT>
                    <OBJECT Class = "link" Name = "Modulation">
                        <OBJECT Class = "Modulation" Name = "BPSK">
                            <OBJECT Class = "bool" Name = "Clonable"> True </OBJECT>
                            <OBJECT Class = "string" Name = "Description"> &quot;BPSK&quot; </OBJECT>
                            <OBJECT Class = "bool" Name = "ReadOnly"> False </OBJECT>
                            <OBJECT Class = "string" Name = "Type"> &quot;BPSK&quot; </OBJECT>
                            <OBJECT Class = "string" Name = "UserComment"> &quot;BPSK&quot; </OBJECT>
                            <OBJECT Class = "string" Name = "Version"> &quot;1.0.0 a&quot; </OBJECT>
                        </OBJECT>
                    </OBJECT>
                    <OBJECT Class = "bool" Name = "ReadOnly"> False </OBJECT>
                    <OBJECT Class = "bool" Name = "SymmetricBandwidth"> True </OBJECT>
                    <OBJECT Class = "string" Name = "Type"> &quot;Basic Modulator&quot; </OBJECT>
                    <OBJECT Class = "double" Name = "UpperBandwidthLimit"> 16000000 Hz </OBJECT>
                    <OBJECT Class = "bool" Name = "UseCDMASpread"> False </OBJECT>
                    <OBJECT Class = "string" Name = "UserComment"> &quot;Basic Modulator&quot; </OBJECT>
                    <OBJECT Class = "bool" Name = "UseSignalPSD"> False </OBJECT>
                    <OBJECT Class = "string" Name = "Version"> &quot;1.0.0 a&quot; </OBJECT>
                </OBJECT>
            </OBJECT>
            <OBJECT Class = "AttrCon" Name = "PostTransmitGainsLosses">
                <OBJECT Class = "container" Name = "GainLossList" />
            </OBJECT>
            <OBJECT Class = "double" Name = "Power"> 1000 W </OBJECT>
            <OBJECT Class = "bool" Name = "ReadOnly"> False </OBJECT>
            <OBJECT Class = "string" Name = "Type"> &quot;Complex Transmitter Model&quot; </OBJECT>
            <OBJECT Class = "bool" Name = "UseFilter"> False </OBJECT>
            <OBJECT Class = "string" Name = "UserComment"> &quot;Complex model of a transmitter&quot; </OBJECT>
            <OBJECT Class = "string" Name = "Version"> &quot;1.0.0 a&quot; </OBJECT>
        </OBJECT>
    </OBJECT>
    <OBJECT Class = "bool" Name = "ReadOnly"> False </OBJECT>
    <OBJECT Class = "string" Name = "Type"> &quot;CAgSTKTransmitterObject&quot; </OBJECT>
    <OBJECT Class = "string" Name = "UserComment"> &quot;STK Transmitter Object&quot; </OBJECT>
    <OBJECT Class = "string" Name = "Version"> &quot;1.0.0 a&quot; </OBJECT>
</OBJECT>
</STKOBJECT>

END	Transmitter

BEGIN Extensions
    
    BEGIN Graphics

BEGIN Graphics

	Relative          Off
	ShowBoresight     On
	BoresightMarker   4
	BoresightColor    #ffffff

END Graphics
    END Graphics
    
    BEGIN ContourGfx
	ShowContours      Off
    END ContourGfx
    
    BEGIN ExternData
    END ExternData
    
    BEGIN ADFFileData
    END ADFFileData
    
    BEGIN AccessConstraints
		LineOfSight   IncludeIntervals 
    END AccessConstraints
    
    BEGIN ObjectCoverage
    END ObjectCoverage
    
    BEGIN Desc
    END Desc
    
    BEGIN Refraction
		RefractionModel	Effective Radius Method

		UseRefractionInAccess		No

		BEGIN ModelData
			RefractionCeiling	5.00000000000000e+003
			MaxTargetAltitude	1.00000000000000e+004
			EffectiveRadius		1.33333333333333e+000

			UseExtrapolation	 Yes


		END ModelData
    END Refraction
    
    BEGIN Contours
	ActiveContourType Antenna Gain

	BEGIN ContourSet Antenna Gain
		Altitude          0.000000e+000
		ShowAtAltitude    On
		Projected         On
		Relative          On
		ShowLabels        Off
		LineWidth         1.000000
		DecimalDigits     1
		ColorRamp         On
		ColorRampStartColor   #ff0000
		ColorRampEndColor     #0000ff

		BEGIN ContourLevel
			Value            -120.000000
			Color            #ff0000
			LineStyle        0
		END ContourLevel

		BEGIN ContourLevel
			Value            -110.000000
			Color            #ff5400
			LineStyle        0
		END ContourLevel

		BEGIN ContourLevel
			Value            -100.000000
			Color            #ffaa00
			LineStyle        0
		END ContourLevel

		BEGIN ContourLevel
			Value            -90.000000
			Color            #ffff00
			LineStyle        0
		END ContourLevel

		BEGIN ContourLevel
			Value            -80.000000
			Color            #aaff00
			LineStyle        0
		END ContourLevel

		BEGIN ContourLevel
			Value            -70.000000
			Color            #54ff00
			LineStyle        0
		END ContourLevel

		BEGIN ContourLevel
			Value            -60.000000
			Color            #00ff00
			LineStyle        0
		END ContourLevel

		BEGIN ContourLevel
			Value            -50.000000
			Color            #00ff55
			LineStyle        0
		END ContourLevel

		BEGIN ContourLevel
			Value            -40.000000
			Color            #00ffa9
			LineStyle        0
		END ContourLevel

		BEGIN ContourLevel
			Value            -30.000000
			Color            #00ffff
			LineStyle        0
		END ContourLevel

		BEGIN ContourLevel
			Value            -20.000000
			Color            #00a9ff
			LineStyle        0
		END ContourLevel

		BEGIN ContourLevel
			Value            -10.000000
			Color            #0055ff
			LineStyle        0
		END ContourLevel

		BEGIN ContourLevel
			Value            0.000000
			Color            #0000ff
			LineStyle        0
		END ContourLevel
		BEGIN ContourDefinition
		BEGIN CntrAntAzEl
			BEGIN AzElPattern
				BEGIN AzElPatternDef
					SetResolutionTogether 1
					CoordinateSystem 0
					NumAzPoints      50
					AzimuthRes       7.346939
					MinAzimuth       -180.000000
					MaxAzimuth       180.000000
					NumElPoints      10
					ElevationRes     7.777778
					MinElevation     0.000000
					MaxElevation     70.000000
				END AzElPatternDef
			END AzElPattern
		END CntrAntAzEl
		END ContourDefinition
	END ContourSet

	BEGIN ContourSet EIRP
		Altitude          0.000000e+000
		ShowAtAltitude    Off
		Projected         On
		Relative          On
		ShowLabels        On
		LineWidth         1.000000
		DecimalDigits     1
		ColorRamp         On
		ColorRampStartColor   #ff0000
		ColorRampEndColor     #0000ff

		BEGIN ContourLevel
			Value            0.000000
			Color            #ff0000
			LineStyle        0
		END ContourLevel

		BEGIN ContourLevel
			Value            5.000000
			Color            #ff6600
			LineStyle        0
		END ContourLevel

		BEGIN ContourLevel
			Value            10.000000
			Color            #ffcc00
			LineStyle        0
		END ContourLevel

		BEGIN ContourLevel
			Value            15.000000
			Color            #ccff00
			LineStyle        0
		END ContourLevel

		BEGIN ContourLevel
			Value            20.000000
			Color            #65ff00
			LineStyle        0
		END ContourLevel

		BEGIN ContourLevel
			Value            25.000000
			Color            #00ff00
			LineStyle        0
		END ContourLevel

		BEGIN ContourLevel
			Value            30.000000
			Color            #00ff65
			LineStyle        0
		END ContourLevel

		BEGIN ContourLevel
			Value            35.000000
			Color            #00ffcb
			LineStyle        0
		END ContourLevel

		BEGIN ContourLevel
			Value            40.000000
			Color            #00cbff
			LineStyle        0
		END ContourLevel

		BEGIN ContourLevel
			Value            45.000000
			Color            #0066ff
			LineStyle        0
		END ContourLevel

		BEGIN ContourLevel
			Value            50.000000
			Color            #0000ff
			LineStyle        0
		END ContourLevel
		BEGIN ContourDefinition
		BEGIN CntrAntAzEl
			BEGIN AzElPattern
				BEGIN AzElPatternDef
					SetResolutionTogether 0
					CoordinateSystem 0
					NumAzPoints      50
					AzimuthRes       7.346939
					MinAzimuth       -180.000000
					MaxAzimuth       180.000000
					NumElPoints      50
					ElevationRes     1.836735
					MinElevation     0.000000
					MaxElevation     90.000000
				END AzElPatternDef
			END AzElPattern
		END CntrAntAzEl
		END ContourDefinition
	END ContourSet

	BEGIN ContourSet Flux Density
		Altitude          0.000000e+000
		ShowAtAltitude    Off
		Projected         On
		Relative          On
		ShowLabels        Off
		LineWidth         1.000000
		DecimalDigits     1
		ColorRamp         On
		ColorRampStartColor   #0000ff
		ColorRampEndColor     #ff0000
		BEGIN ContourDefinition
		BEGIN CntrAntLatLon
			SetResolutionTogether   true
			Resolution	9.000000  9.000000
			ElevationAngleConstraint	90.000000
			BEGIN LatLonSphGrid
				Centroid	0.000000	0.000000
				ConeAngle	0.000000
				NumPts		50	20
				Altitude	0.000000
			END LatLonSphGrid
		END CntrAntLatLon
		END ContourDefinition
	END ContourSet

	BEGIN ContourSet RIP
		Altitude          0.000000e+000
		ShowAtAltitude    Off
		Projected         On
		Relative          On
		ShowLabels        Off
		LineWidth         1.000000
		DecimalDigits     1
		ColorRamp         On
		ColorRampStartColor   #0000ff
		ColorRampEndColor     #ff0000
		BEGIN ContourDefinition
		BEGIN CntrAntLatLon
			SetResolutionTogether   true
			Resolution	9.000000  9.000000
			ElevationAngleConstraint	90.000000
			BEGIN LatLonSphGrid
				Centroid	0.000000	0.000000
				ConeAngle	0.000000
				NumPts		50	20
				Altitude	0.000000
			END LatLonSphGrid
		END CntrAntLatLon
		END ContourDefinition
	END ContourSet
    END Contours
    
    BEGIN Crdn
    END Crdn
    
    BEGIN VO
    END VO
    
    BEGIN 3dVolume
	ActiveVolumeType  Antenna Beam

	BEGIN VolumeSet Antenna Beam
	Scale 5.000000
	NumericGainOffset 1.000000
	Frequency 14500000000.000000
	ShowAsWireframe 0
				BEGIN AzElPatternDef
					SetResolutionTogether 0
					CoordinateSystem 0
					NumAzPoints      50
					AzimuthRes       7.346939
					MinAzimuth       -180.000000
					MaxAzimuth       180.000000
					NumElPoints      50
					ElevationRes     1.836735
					MinElevation     0.000000
					MaxElevation     90.000000
				END AzElPatternDef
	END VolumeSet
Begin VolumeGraphics
	ShowContours    Yes
	ShowVolume No
End VolumeGraphics
    END 3dVolume

END Extensions
