<?xml version = "1.0" standalone = "yes"?>
<VAR name = "ODTK">
    <PROP name = "Version">
        <STRING>&quot;7.0&quot;</STRING>
    </PROP>
    <SCOPE>
        <VAR name = "Example10-4">
            <SCOPE Class = "Scenario">
                <PROP name = "version">
                    <STRING>&quot;7.7&quot;</STRING>
                </PROP>
                <VAR name = "Description">
                    <STRING>&quot;&quot;</STRING>
                </VAR>
                <VAR name = "OverrideRunName">
                    <BOOL>false</BOOL>
                </VAR>
                <VAR name = "NewRunFilename">
                    <STRING>&quot;&quot;</STRING>
                </VAR>
                <VAR name = "DefaultTimes">
                    <SCOPE Class = "DefaultTimes">
                        <VAR name = "Processes">
                            <SCOPE Class = "Processes">
                                <VAR name = "StartMode">
                                    <STRING>&quot;EarliestSatEpoch&quot;</STRING>
                                </VAR>
                                <VAR name = "StartTime">
                                    <DATE>1 Jul 2006 12:00:33.000</DATE>
                                </VAR>
                                <VAR name = "StopMode">
                                    <STRING>&quot;TimeSpan&quot;</STRING>
                                </VAR>
                                <VAR name = "StopTime">
                                    <DATE>2 Jul 2006 12:00:33.000</DATE>
                                </VAR>
                                <VAR name = "TimeSpan">
                                    <QUANTITY Dimension = "TimeUnit" Unit = "hr">
                                        <REAL>24</REAL>
                                    </QUANTITY>
                                </VAR>
                            </SCOPE>
                        </VAR>
                        <VAR name = "Intervals">
                            <SCOPE Class = "Intervals">
                                <VAR name = "TimeSpan">
                                    <QUANTITY Dimension = "TimeUnit" Unit = "hr">
                                        <REAL>4</REAL>
                                    </QUANTITY>
                                </VAR>
                            </SCOPE>
                        </VAR>
                    </SCOPE>
                </VAR>
                <VAR name = "Measurements">
                    <SCOPE Class = "TrackingFiles">
                        <VAR name = "Files">
                            <LIST>
                                <VAR name = "TrackingFile">
                                    <SCOPE>
                                        <VAR name = "Enabled">
                                            <BOOL>true</BOOL>
                                        </VAR>
                                        <VAR name = "Filename">
                                            <STRING>&quot;D:\STKFiles Educational Files\BookEx10_4\7734.OBS&quot;</STRING>
                                        </VAR>
                                        <VAR name = "AliasMapping">
                                            <STRING>&quot;&quot;</STRING>
                                        </VAR>
                                    </SCOPE>
                                </VAR>
                                <VAR name = "TrackingFile">
                                    <SCOPE>
                                        <VAR name = "Enabled">
                                            <BOOL>false</BOOL>
                                        </VAR>
                                        <VAR name = "Filename">
                                            <STRING>&quot;D:\STKFiles Educational Files\BookEx10_4\23558.obs&quot;</STRING>
                                        </VAR>
                                        <VAR name = "AliasMapping">
                                            <STRING>&quot;&quot;</STRING>
                                        </VAR>
                                    </SCOPE>
                                </VAR>
                            </LIST>
                        </VAR>
                        <VAR name = "RoundTripRepresentation">
                            <STRING>&quot;OneWay&quot;</STRING>
                        </VAR>
                        <VAR name = "LookAheadBufferSize">
                            <INT>100</INT>
                        </VAR>
                        <VAR name = "EmbeddedWNSigmas">
                            <SCOPE>
                                <VAR name = "Use">
                                    <BOOL>false</BOOL>
                                </VAR>
                                <VAR name = "OnInputError">
                                    <STRING>&quot;UseDefaultWNSigma&quot;</STRING>
                                </VAR>
                            </SCOPE>
                        </VAR>
                        <VAR name = "ViewAndSave">
                            <SCOPE Class = "ViewAndSave">
                                <VAR name = "CustomDataEditing">
                                    <SCOPE Class = "CustomDataEditing">
                                        <VAR name = "Enabled">
                                            <BOOL>false</BOOL>
                                        </VAR>
                                        <VAR name = "Schedule">
                                            <LIST />
                                        </VAR>
                                    </SCOPE>
                                </VAR>
                            </SCOPE>
                        </VAR>
                    </SCOPE>
                </VAR>
                <VAR name = "StateControls">
                    <SCOPE Class = "StateControls">
                        <VAR name = "MinApogeeAltForSRP">
                            <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                <REAL>400</REAL>
                            </QUANTITY>
                        </VAR>
                        <VAR name = "MaxPerigeeAltForDrag">
                            <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                <REAL>1000</REAL>
                            </QUANTITY>
                        </VAR>
                    </SCOPE>
                </VAR>
                <VAR name = "OrbitClassifications">
                    <SCOPE Class = "OrbitClassifications">
                        <VAR name = "LEO">
                            <SCOPE Class = "LEOOrbitClass">
                                <VAR name = "SemiMajorAxisMin">
                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                        <REAL>6441.91837</REAL>
                                    </QUANTITY>
                                </VAR>
                                <VAR name = "SemiMajorAxisMax">
                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                        <REAL>8291.578100000001</REAL>
                                    </QUANTITY>
                                </VAR>
                                <VAR name = "EccentricityMin">
                                    <REAL>0</REAL>
                                </VAR>
                                <VAR name = "EccentricityMax">
                                    <REAL>0.2</REAL>
                                </VAR>
                            </SCOPE>
                        </VAR>
                        <VAR name = "MEO">
                            <SCOPE Class = "MEO">
                                <VAR name = "SemiMajorAxisMin">
                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                        <REAL>8291.578100000001</REAL>
                                    </QUANTITY>
                                </VAR>
                                <VAR name = "SemiMajorAxisMax">
                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                        <REAL>25512.548</REAL>
                                    </QUANTITY>
                                </VAR>
                                <VAR name = "EccentricityMin">
                                    <REAL>0</REAL>
                                </VAR>
                                <VAR name = "EccentricityMax">
                                    <REAL>0.2</REAL>
                                </VAR>
                            </SCOPE>
                        </VAR>
                        <VAR name = "GPS">
                            <SCOPE Class = "GPS">
                                <VAR name = "SemiMajorAxisMin">
                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                        <REAL>25512.548</REAL>
                                    </QUANTITY>
                                </VAR>
                                <VAR name = "SemiMajorAxisMax">
                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                        <REAL>41457.8905</REAL>
                                    </QUANTITY>
                                </VAR>
                                <VAR name = "EccentricityMin">
                                    <REAL>0</REAL>
                                </VAR>
                                <VAR name = "EccentricityMax">
                                    <REAL>0.2</REAL>
                                </VAR>
                            </SCOPE>
                        </VAR>
                        <VAR name = "GEO">
                            <SCOPE Class = "GEO">
                                <VAR name = "SemiMajorAxisMin">
                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                        <REAL>41457.8905</REAL>
                                    </QUANTITY>
                                </VAR>
                                <VAR name = "SemiMajorAxisMax">
                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                        <REAL>43371.33160000001</REAL>
                                    </QUANTITY>
                                </VAR>
                                <VAR name = "EccentricityMin">
                                    <REAL>0</REAL>
                                </VAR>
                                <VAR name = "EccentricityMax">
                                    <REAL>0.2</REAL>
                                </VAR>
                            </SCOPE>
                        </VAR>
                        <VAR name = "SGEO">
                            <SCOPE Class = "GSGEO">
                                <VAR name = "SemiMajorAxisMin">
                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                        <REAL>43371.33160000001</REAL>
                                    </QUANTITY>
                                </VAR>
                                <VAR name = "SemiMajorAxisMax">
                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                        <REAL>63781370000000</REAL>
                                    </QUANTITY>
                                </VAR>
                                <VAR name = "EccentricityMin">
                                    <REAL>0</REAL>
                                </VAR>
                                <VAR name = "EccentricityMax">
                                    <REAL>0.2</REAL>
                                </VAR>
                            </SCOPE>
                        </VAR>
                        <VAR name = "HEO">
                            <SCOPE Class = "HEO">
                                <VAR name = "SemiMajorAxisMin">
                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                        <REAL>8291.578100000001</REAL>
                                    </QUANTITY>
                                </VAR>
                                <VAR name = "SemiMajorAxisMax">
                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                        <REAL>63781370000000</REAL>
                                    </QUANTITY>
                                </VAR>
                                <VAR name = "EccentricityMin">
                                    <REAL>0.6899999999999999</REAL>
                                </VAR>
                                <VAR name = "EccentricityMax">
                                    <REAL>0.73</REAL>
                                </VAR>
                            </SCOPE>
                        </VAR>
                        <VAR name = "LOeHEO">
                            <SCOPE Class = "LOeHEO">
                                <VAR name = "SemiMajorAxisMin">
                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                        <REAL>8291.578100000001</REAL>
                                    </QUANTITY>
                                </VAR>
                                <VAR name = "SemiMajorAxisMax">
                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                        <REAL>63781370000000</REAL>
                                    </QUANTITY>
                                </VAR>
                                <VAR name = "EccentricityMin">
                                    <REAL>0.2</REAL>
                                </VAR>
                                <VAR name = "EccentricityMax">
                                    <REAL>0.6899999999999999</REAL>
                                </VAR>
                            </SCOPE>
                        </VAR>
                        <VAR name = "HIeHEO">
                            <SCOPE Class = "HIeHEO">
                                <VAR name = "SemiMajorAxisMin">
                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                        <REAL>8291.578100000001</REAL>
                                    </QUANTITY>
                                </VAR>
                                <VAR name = "SemiMajorAxisMax">
                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                        <REAL>63781370000000</REAL>
                                    </QUANTITY>
                                </VAR>
                                <VAR name = "EccentricityMin">
                                    <REAL>0.73</REAL>
                                </VAR>
                                <VAR name = "EccentricityMax">
                                    <REAL>1</REAL>
                                </VAR>
                            </SCOPE>
                        </VAR>
                        <VAR name = "Para">
                            <SCOPE Class = "Para">
                                <VAR name = "EccentricityMin">
                                    <REAL>1</REAL>
                                </VAR>
                                <VAR name = "EccentricityMax">
                                    <REAL>1</REAL>
                                </VAR>
                            </SCOPE>
                        </VAR>
                        <VAR name = "Hyper">
                            <SCOPE Class = "Hyper">
                                <VAR name = "SemiMajorAxisMin">
                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                        <REAL>-63781370000000</REAL>
                                    </QUANTITY>
                                </VAR>
                                <VAR name = "SemiMajorAxisMax">
                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                        <REAL>0</REAL>
                                    </QUANTITY>
                                </VAR>
                                <VAR name = "EccentricityMin">
                                    <REAL>1</REAL>
                                </VAR>
                                <VAR name = "EccentricityMax">
                                    <REAL>10000000000</REAL>
                                </VAR>
                            </SCOPE>
                        </VAR>
                    </SCOPE>
                </VAR>
                <VAR name = "EarthDefinition">
                    <SCOPE>
                        <VAR name = "LeapSecondFilename">
                            <STRING>&quot;C:\ProgramData\AGI\ODTK 7\DynamicEarthData\LeapSecond.dat&quot;</STRING>
                        </VAR>
                        <VAR name = "GravityModel">
                            <STRING>&quot;C:\Program Files\AGI\ODTK 7\STKData\CentralBodies\Earth\JGM2.grv&quot;</STRING>
                        </VAR>
                        <VAR name = "OverrideGravityProcessNoise">
                            <BOOL>false</BOOL>
                        </VAR>
                        <VAR name = "NutationMethod">
                            <STRING>&quot;IERS1996&quot;</STRING>
                        </VAR>
                        <VAR name = "EclipsingAtmosAlt">
                            <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                <REAL>23.862995940238</REAL>
                            </QUANTITY>
                        </VAR>
                        <VAR name = "GroundReflectionModel">
                            <STRING>&quot;C:\Program Files\AGI\ODTK 7\STKData\CentralBodies\Earth\SimpleReflectionModel.txt&quot;</STRING>
                        </VAR>
                        <VAR name = "EOPData">
                            <SCOPE>
                                <VAR name = "Filename">
                                    <STRING>&quot;D:\STKFiles Educational Files\BookEx10_4\eop19620101.txt&quot;</STRING>
                                </VAR>
                                <VAR name = "ValidateFileSpan">
                                    <BOOL>true</BOOL>
                                </VAR>
                                <VAR name = "WarnThreshold">
                                    <QUANTITY Dimension = "TimeUnit" Unit = "day">
                                        <REAL>1</REAL>
                                    </QUANTITY>
                                </VAR>
                            </SCOPE>
                        </VAR>
                        <VAR name = "FluxData">
                            <SCOPE>
                                <VAR name = "InputMethod">
                                    <STRING>&quot;Read From File&quot;</STRING>
                                </VAR>
                                <VAR name = "InputFluxFile">
                                    <STRING>&quot;D:\STKFiles Educational Files\BookEx10_4\sw19571001.txt&quot;</STRING>
                                </VAR>
                                <VAR name = "F10">
                                    <REAL>150</REAL>
                                </VAR>
                                <VAR name = "F10bar">
                                    <REAL>150</REAL>
                                </VAR>
                                <VAR name = "KpUpdate">
                                    <STRING>&quot;3-Hourly&quot;</STRING>
                                </VAR>
                                <VAR name = "KpSubSamplingRatio">
                                    <INT>0</INT>
                                </VAR>
                                <VAR name = "UseApOrKp">
                                    <STRING>&quot;Kp&quot;</STRING>
                                </VAR>
                                <VAR name = "ApVersusKp">
                                    <STRING>&quot;Kp&quot;</STRING>
                                </VAR>
                                <VAR name = "Ap">
                                    <REAL>6.868034776295194</REAL>
                                </VAR>
                                <VAR name = "Kp">
                                    <REAL>1.966301126216909</REAL>
                                </VAR>
                                <VAR name = "ValidateFileSpan">
                                    <BOOL>true</BOOL>
                                </VAR>
                                <VAR name = "WarnThreshold">
                                    <QUANTITY Dimension = "TimeUnit" Unit = "day">
                                        <REAL>1</REAL>
                                    </QUANTITY>
                                </VAR>
                                <VAR name = "JacchiaBowmanIndices">
                                    <SCOPE>
                                        <VAR name = "InputJBSolarIndicesFile">
                                            <STRING>&quot;&quot;</STRING>
                                        </VAR>
                                        <VAR name = "InputJBGeoMagIndicesFile">
                                            <STRING>&quot;&quot;</STRING>
                                        </VAR>
                                        <VAR name = "M10">
                                            <REAL>150</REAL>
                                        </VAR>
                                        <VAR name = "M10bar">
                                            <REAL>150</REAL>
                                        </VAR>
                                        <VAR name = "S10">
                                            <REAL>150</REAL>
                                        </VAR>
                                        <VAR name = "S10bar">
                                            <REAL>150</REAL>
                                        </VAR>
                                        <VAR name = "Y10">
                                            <REAL>150</REAL>
                                        </VAR>
                                        <VAR name = "Y10bar">
                                            <REAL>150</REAL>
                                        </VAR>
                                        <VAR name = "DstDTc">
                                            <REAL>0</REAL>
                                        </VAR>
                                    </SCOPE>
                                </VAR>
                            </SCOPE>
                        </VAR>
                        <VAR name = "Ionosphere">
                            <SCOPE>
                                <VAR name = "IRI20xxDataDirectory">
                                    <STRING>&quot;C:\ProgramData\AGI\ODTK 7\DynamicEarthData\IRI2016ModelData\&quot;</STRING>
                                </VAR>
                                <VAR name = "ApSource">
                                    <STRING>&quot;IRIDataFile&quot;</STRING>
                                </VAR>
                                <VAR name = "SpaceWeatherFilename">
                                    <STRING>&quot;C:\ProgramData\AGI\ODTK 7\DynamicEarthData\SpaceWeather-All-v1.2.txt&quot;</STRING>
                                </VAR>
                            </SCOPE>
                        </VAR>
                        <VAR name = "DSNMediaCalibrationData">
                            <SCOPE Class = "DSNMediaCalibrationFile">
                                <VAR name = "Files">
                                    <LIST />
                                </VAR>
                            </SCOPE>
                        </VAR>
                    </SCOPE>
                </VAR>
                <VAR name = "SuppressICRF">
                    <BOOL>true</BOOL>
                </VAR>
                <VAR name = "CentralBodyList">
                    <LIST>
                        <VAR name = "CentralBodyList">
                            <SCOPE>
                                <VAR name = "Name">
                                    <STRING>&quot;Moon&quot;</STRING>
                                </VAR>
                                <VAR name = "GravityModel">
                                    <STRING>&quot;C:\Program Files\AGI\ODTK 7\STKData\CentralBodies\Moon\LP100K.grv&quot;</STRING>
                                </VAR>
                                <VAR name = "EclipsingAtmosAlt">
                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                        <REAL>0</REAL>
                                    </QUANTITY>
                                </VAR>
                                <VAR name = "GroundReflectionModel">
                                    <STRING>&quot;C:\Program Files\AGI\ODTK 7\STKData\CentralBodies\Moon\SimpleReflectionModel.txt&quot;</STRING>
                                </VAR>
                                <VAR name = "EstimateOrbitCorrection">
                                    <BOOL>false</BOOL>
                                </VAR>
                                <VAR name = "OrbitUncertainty">
                                    <SCOPE>
                                        <VAR name = "R_sigma">
                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                <REAL>2000</REAL>
                                            </QUANTITY>
                                        </VAR>
                                        <VAR name = "I_sigma">
                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                <REAL>20000</REAL>
                                            </QUANTITY>
                                        </VAR>
                                        <VAR name = "C_sigma">
                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                <REAL>20000</REAL>
                                            </QUANTITY>
                                        </VAR>
                                        <VAR name = "Rdot_sigma">
                                            <QUANTITY Dimension = "Rate" Unit = "m*sec^-1">
                                                <REAL>1</REAL>
                                            </QUANTITY>
                                        </VAR>
                                        <VAR name = "Idot_sigma">
                                            <QUANTITY Dimension = "Rate" Unit = "m*sec^-1">
                                                <REAL>1</REAL>
                                            </QUANTITY>
                                        </VAR>
                                        <VAR name = "Cdot_sigma">
                                            <QUANTITY Dimension = "Rate" Unit = "m*sec^-1">
                                                <REAL>1</REAL>
                                            </QUANTITY>
                                        </VAR>
                                        <VAR name = "RI_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "RC_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "RRdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "RIdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "RCdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "IC_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "IRdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "IIdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "ICdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "CRdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "CIdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "CCdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "RdotIdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "RdotCdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "IdotCdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                    </SCOPE>
                                </VAR>
                                <VAR name = "EstimateGM">
                                    <BOOL>false</BOOL>
                                </VAR>
                                <VAR name = "GMScaleSigma">
                                    <REAL>0.3</REAL>
                                </VAR>
                            </SCOPE>
                        </VAR>
                        <VAR name = "CentralBodyList">
                            <SCOPE>
                                <VAR name = "Name">
                                    <STRING>&quot;Sun&quot;</STRING>
                                </VAR>
                                <VAR name = "GravityModel">
                                    <STRING>&quot;C:\Program Files\AGI\ODTK 7\STKData\CentralBodies\Sun\ZonalsToJ4.grv&quot;</STRING>
                                </VAR>
                                <VAR name = "EclipsingAtmosAlt">
                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                        <REAL>0</REAL>
                                    </QUANTITY>
                                </VAR>
                                <VAR name = "GroundReflectionModel">
                                    <STRING>&quot;&quot;</STRING>
                                </VAR>
                                <VAR name = "EstimateOrbitCorrection">
                                    <BOOL>false</BOOL>
                                </VAR>
                                <VAR name = "OrbitUncertainty">
                                    <SCOPE>
                                        <VAR name = "R_sigma">
                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                <REAL>2000</REAL>
                                            </QUANTITY>
                                        </VAR>
                                        <VAR name = "I_sigma">
                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                <REAL>20000</REAL>
                                            </QUANTITY>
                                        </VAR>
                                        <VAR name = "C_sigma">
                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                <REAL>20000</REAL>
                                            </QUANTITY>
                                        </VAR>
                                        <VAR name = "Rdot_sigma">
                                            <QUANTITY Dimension = "Rate" Unit = "m*sec^-1">
                                                <REAL>1</REAL>
                                            </QUANTITY>
                                        </VAR>
                                        <VAR name = "Idot_sigma">
                                            <QUANTITY Dimension = "Rate" Unit = "m*sec^-1">
                                                <REAL>1</REAL>
                                            </QUANTITY>
                                        </VAR>
                                        <VAR name = "Cdot_sigma">
                                            <QUANTITY Dimension = "Rate" Unit = "m*sec^-1">
                                                <REAL>1</REAL>
                                            </QUANTITY>
                                        </VAR>
                                        <VAR name = "RI_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "RC_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "RRdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "RIdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "RCdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "IC_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "IRdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "IIdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "ICdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "CRdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "CIdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "CCdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "RdotIdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "RdotCdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "IdotCdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                    </SCOPE>
                                </VAR>
                                <VAR name = "EstimateGM">
                                    <BOOL>false</BOOL>
                                </VAR>
                                <VAR name = "GMScaleSigma">
                                    <REAL>0.3</REAL>
                                </VAR>
                            </SCOPE>
                        </VAR>
                    </LIST>
                </VAR>
                <VAR name = "PlanetaryEphemeris">
                    <SCOPE Class = "PlanetaryEphemeris">
                        <VAR name = "Filename">
                            <STRING>&quot;C:\Program Files\AGI\ODTK 7\STKData\PlanetEphem\lendian\plneph.405&quot;</STRING>
                        </VAR>
                        <VAR name = "UseTDB">
                            <BOOL>false</BOOL>
                        </VAR>
                    </SCOPE>
                </VAR>
                <VAR name = "SPICE">
                    <SCOPE Class = "SPICE" />
                </VAR>
                <VAR name = "SatEphemeris">
                    <SCOPE Class = "SatEphemeris">
                        <VAR name = "CoordFrame">
                            <LIST>
                                <VAR name = "SatEphemerisCoordFrame">
                                    <SCOPE>
                                        <VAR name = "CBName">
                                            <STRING>&quot;Earth&quot;</STRING>
                                        </VAR>
                                        <VAR name = "CoordFrame">
                                            <STRING>&quot;J2000&quot;</STRING>
                                        </VAR>
                                    </SCOPE>
                                </VAR>
                                <VAR name = "SatEphemerisCoordFrame">
                                    <SCOPE>
                                        <VAR name = "CBName">
                                            <STRING>&quot;Moon&quot;</STRING>
                                        </VAR>
                                        <VAR name = "CoordFrame">
                                            <STRING>&quot;Inertial&quot;</STRING>
                                        </VAR>
                                    </SCOPE>
                                </VAR>
                                <VAR name = "SatEphemerisCoordFrame">
                                    <SCOPE>
                                        <VAR name = "CBName">
                                            <STRING>&quot;Sun&quot;</STRING>
                                        </VAR>
                                        <VAR name = "CoordFrame">
                                            <STRING>&quot;J2000&quot;</STRING>
                                        </VAR>
                                    </SCOPE>
                                </VAR>
                            </LIST>
                        </VAR>
                        <VAR name = "CCSDS">
                            <SCOPE Class = "OEM">
                                <VAR name = "Originator">
                                    <STRING>&quot;ODTK&quot;</STRING>
                                </VAR>
                                <VAR name = "DateFormat">
                                    <STRING>&quot;YMD&quot;</STRING>
                                </VAR>
                                <VAR name = "TimePrecision">
                                    <INT>6</INT>
                                </VAR>
                                <VAR name = "EphemerisFormat">
                                    <STRING>&quot;SciNotation&quot;</STRING>
                                </VAR>
                                <VAR name = "OutputVersion">
                                    <STRING>&quot;2.0&quot;</STRING>
                                </VAR>
                            </SCOPE>
                        </VAR>
                    </SCOPE>
                </VAR>
                <VAR name = "Units">
                    <SCOPE Class = "Units">
                        <VAR name = "DateFormat">
                            <STRING>&quot;UTCG&quot;</STRING>
                        </VAR>
                    </SCOPE>
                </VAR>
                <VAR name = "QuasarDatabaseFilename">
                    <STRING>&quot;&quot;</STRING>
                </VAR>
                <VAR name = "FacilityAssociationsFile">
                    <STRING>&quot;&quot;</STRING>
                </VAR>
                <VAR name = "Wizard">
                    <SCOPE Class = "WizardClass">
                        <VAR name = "StartTime">
                            <DATE>1 Jul 2006 12:00:33.000</DATE>
                        </VAR>
                        <VAR name = "StopTime">
                            <DATE>2 Jul 2006 12:00:33.000</DATE>
                        </VAR>
                    </SCOPE>
                </VAR>
                <VAR name = "Children">
                    <SCOPE>
                        <VAR name = "Satellite">
                            <SCOPE>
                                <VAR name = "Sat7734">
                                    <SCOPE Class = "Satellite">
                                        <PROP name = "version">
                                            <STRING>&quot;7.7&quot;</STRING>
                                        </PROP>
                                        <VAR name = "Description">
                                            <STRING>&quot;&quot;</STRING>
                                        </VAR>
                                        <VAR name = "MotionType">
                                            <STRING>&quot;Orbiter&quot;</STRING>
                                        </VAR>
                                        <VAR name = "MotionModel">
                                            <STRING>&quot;Orbiter&quot;</STRING>
                                        </VAR>
                                        <VAR name = "EstimateOrbit">
                                            <BOOL>true</BOOL>
                                        </VAR>
                                        <VAR name = "EstimateLocation">
                                            <BOOL>true</BOOL>
                                        </VAR>
                                        <VAR name = "OrbitState">
                                            <PROP name = "DisplayCoordFlag">
                                                <STRING>&quot;Cartesian&quot;</STRING>
                                            </PROP>
                                            <SCOPE Class = "Cartesian">
                                                <VAR name = "CentralBody">
                                                    <STRING>&quot;Earth&quot;</STRING>
                                                </VAR>
                                                <VAR name = "CoordFrame">
                                                    <STRING>&quot;J2000&quot;</STRING>
                                                </VAR>
                                                <VAR name = "Epoch">
                                                    <DATE>29 Jan 1995 02:39:06.000</DATE>
                                                </VAR>
                                                <VAR name = "XPosition">
                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                                        <REAL>5975.290400000001</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "YPosition">
                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                                        <REAL>2568.640000000002</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "ZPosition">
                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                                        <REAL>3120.584500000001</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "XVelocity">
                                                    <QUANTITY Dimension = "Rate" Unit = "km*sec^-1">
                                                        <REAL>3.983846000000001</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "YVelocity">
                                                    <QUANTITY Dimension = "Rate" Unit = "km*sec^-1">
                                                        <REAL>-2.071159000000002</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "ZVelocity">
                                                    <QUANTITY Dimension = "Rate" Unit = "km*sec^-1">
                                                        <REAL>-5.917095000000002</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "CentralBody">
                                            <STRING>&quot;Earth&quot;</STRING>
                                        </VAR>
                                        <VAR name = "Position">
                                            <PROP name = "DisplayCoordFlag">
                                                <STRING>&quot;Geodetic&quot;</STRING>
                                            </PROP>
                                            <SCOPE Class = "Geodetic">
                                                <VAR name = "Lat">
                                                    <QUANTITY Dimension = "LatitudeUnit" Unit = "rad">
                                                        <REAL>0</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "Lon">
                                                    <QUANTITY Dimension = "LongitudeUnit" Unit = "rad">
                                                        <REAL>0</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "Alt">
                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                        <REAL>0</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "EphemerisSource">
                                            <STRING>&quot;Reference Trajectory&quot;</STRING>
                                        </VAR>
                                        <VAR name = "ReferenceTrajectory">
                                            <SCOPE>
                                                <VAR name = "EphemerisFileFormat">
                                                    <STRING>&quot;STK Ephemeris&quot;</STRING>
                                                </VAR>
                                                <VAR name = "Filename">
                                                    <STRING>&quot;&quot;</STRING>
                                                </VAR>
                                                <VAR name = "SpiceID">
                                                    <STRING>&quot;4 MARS BARYCENTER&quot;</STRING>
                                                </VAR>
                                                <VAR name = "CovarianceSource">
                                                    <STRING>&quot;Reference Trajectory&quot;</STRING>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "DynamicReports">
                                            <SCOPE>
                                                <VAR name = "CentralBody">
                                                    <STRING>&quot;Earth&quot;</STRING>
                                                </VAR>
                                                <VAR name = "OrbitState">
                                                    <STRING>&quot;Keplerian&quot;</STRING>
                                                </VAR>
                                                <VAR name = "CoordFrame">
                                                    <STRING>&quot;J2000&quot;</STRING>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "PhysicalProperties">
                                            <SCOPE>
                                                <VAR name = "Mass">
                                                    <QUANTITY Dimension = "MassUnit" Unit = "kg">
                                                        <REAL>341</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "Attitude">
                                            <SCOPE>
                                                <VAR name = "Source">
                                                    <STRING>&quot;AlignedConstrained&quot;</STRING>
                                                </VAR>
                                                <VAR name = "BodyAlignmentVec">
                                                    <STRING>&quot;MinusZ&quot;</STRING>
                                                </VAR>
                                                <VAR name = "InertialAlignmentVec">
                                                    <STRING>&quot;Radial&quot;</STRING>
                                                </VAR>
                                                <VAR name = "BodyConstraintVec">
                                                    <STRING>&quot;X&quot;</STRING>
                                                </VAR>
                                                <VAR name = "InertialConstraintVec">
                                                    <STRING>&quot;Intrack&quot;</STRING>
                                                </VAR>
                                                <VAR name = "Files">
                                                    <LIST />
                                                </VAR>
                                                <VAR name = "SpiceID">
                                                    <STRING>&quot;BODY -999 INST -999999&quot;</STRING>
                                                </VAR>
                                                <VAR name = "TimeTolTicks">
                                                    <REAL>1</REAL>
                                                </VAR>
                                                <VAR name = "BodySpinAxisDir">
                                                    <STRING>&quot;Z&quot;</STRING>
                                                </VAR>
                                                <VAR name = "InertialSpinAxisRA">
                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                        <REAL>0</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "InertialSpinAxisDec">
                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                        <REAL>90</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "SpinRate">
                                                    <QUANTITY Dimension = "AngleRateUnit" Unit = "deg*sec^-1">
                                                        <REAL>360</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "InitialSpinOffset">
                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                        <REAL>0</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "InitialSpinOffsetEpoch">
                                                    <DATE>1 Jul 2006 12:00:33.000</DATE>
                                                </VAR>
                                                <VAR name = "CenterOfMassInBodyFrame">
                                                    <SCOPE>
                                                        <VAR name = "X">
                                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                <REAL>0</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "Y">
                                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                <REAL>0</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "Z">
                                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                <REAL>0</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "MinGrazingAlt">
                                            <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                                <REAL>100</REAL>
                                            </QUANTITY>
                                        </VAR>
                                        <VAR name = "TransmitFreq">
                                            <QUANTITY Dimension = "FrequencyUnit" Unit = "MHz">
                                                <REAL>2267.5</REAL>
                                            </QUANTITY>
                                        </VAR>
                                        <VAR name = "MeasurementProcessing">
                                            <SCOPE>
                                                <VAR name = "TrackingID">
                                                    <INT>7734</INT>
                                                </VAR>
                                                <VAR name = "TrackingIDAliases">
                                                    <PROP name = "NewElem"></PROP>
                                                    <LIST />
                                                </VAR>
                                                <VAR name = "AllowMeasProcessing">
                                                    <BOOL>true</BOOL>
                                                </VAR>
                                                <VAR name = "MeasTypes">
                                                    <PROP name = "EmptyDescription">
                                                        <STRING>&quot;An empty list allows all measurement types to be processed&quot;</STRING>
                                                    </PROP>
                                                    <LIST>
                                                        <VAR name = "Measurement Type">
                                                            <STRING>&quot;Range&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "Measurement Type">
                                                            <STRING>&quot;Azimuth&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "Measurement Type">
                                                            <STRING>&quot;Elevation&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "Measurement Type">
                                                            <STRING>&quot;Right Ascension&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "Measurement Type">
                                                            <STRING>&quot;Declination&quot;</STRING>
                                                        </VAR>
                                                    </LIST>
                                                </VAR>
                                                <VAR name = "MinPassDelta">
                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                        <REAL>20</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "ForceModel">
                                            <SCOPE>
                                                <VAR name = "Gravity">
                                                    <SCOPE>
                                                        <VAR name = "DegreeAndOrder">
                                                            <INT>2</INT>
                                                        </VAR>
                                                        <VAR name = "Tides">
                                                            <SCOPE>
                                                                <VAR name = "SolidTides">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                                <VAR name = "TimeDependentSolidTides">
                                                                    <BOOL>true</BOOL>
                                                                </VAR>
                                                                <VAR name = "MinSolidTideAmplitude">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "TruncateSolidTides">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                                <VAR name = "OceanTides">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                                <VAR name = "OceanTidesModel">
                                                                    <STRING>&quot;CSR 3.0&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "MaxDegreeOrderOceanTides">
                                                                    <INT>4</INT>
                                                                </VAR>
                                                                <VAR name = "MinOceanTideAmplitude">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "GeneralRelativityCorrection">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "VariationalEquations">
                                                            <SCOPE>
                                                                <VAR name = "Degree">
                                                                    <INT>0</INT>
                                                                </VAR>
                                                                <VAR name = "Order">
                                                                    <INT>0</INT>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "ProcessNoise">
                                                            <SCOPE>
                                                                <VAR name = "Use">
                                                                    <STRING>&quot;Based On Orbit Class&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "OmissionErrorModeling">
                                                                    <SCOPE>
                                                                        <VAR name = "Enabled">
                                                                            <BOOL>true</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "Scale">
                                                                            <REAL>1</REAL>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "CommissionErrorModeling">
                                                                    <SCOPE>
                                                                        <VAR name = "Enabled">
                                                                            <BOOL>true</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "Scale">
                                                                            <REAL>1</REAL>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "MeanMotionUncertaintyScaling">
                                                                    <REAL>1</REAL>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "ThirdBodies">
                                                            <SCOPE>
                                                                <VAR name = "Settings">
                                                                    <LIST />
                                                                </VAR>
                                                                <VAR name = "UseInVariationalEquations">
                                                                    <BOOL>true</BOOL>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "Drag">
                                                    <SCOPE>
                                                        <VAR name = "Use">
                                                            <STRING>&quot;No&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "AtmDensityModel">
                                                            <STRING>&quot;Jacchia-Roberts&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "AtmDensityPlugin">
                                                            <SCOPE Class = "SCOPE">
                                                                <VAR name = "PluginID">
                                                                    <STRING>&quot;&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "PluginConfig">
                                                                    <SCOPE />
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "LowAltAtmDensityModel">
                                                            <STRING>&quot;None&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "DensityBlendingAltRange">
                                                            <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                                                <REAL>30</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "EstimateDensity">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                        <VAR name = "EstimateBallisticCoeff">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                        <VAR name = "Model">
                                                            <PROP name = "Type">
                                                                <STRING>&quot;Spherical&quot;</STRING>
                                                            </PROP>
                                                            <SCOPE Class = "SCOPE">
                                                                <VAR name = "SpecMethod">
                                                                    <STRING>&quot;Mass Area Cd&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "CorrectionType">
                                                                    <STRING>&quot;Ballistic Coeff Relative&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "CD">
                                                                    <REAL>2.200000000000004</REAL>
                                                                </VAR>
                                                                <VAR name = "Area">
                                                                    <QUANTITY Dimension = "Area" Unit = "m^2">
                                                                        <REAL>1.1</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "BallisticCoeff">
                                                                    <REAL>0.007096774193548401</REAL>
                                                                </VAR>
                                                                <VAR name = "BallisticCoeffModel">
                                                                    <PROP name = "Type">
                                                                        <STRING>&quot;GaussMarkov&quot;</STRING>
                                                                    </PROP>
                                                                    <SCOPE>
                                                                        <VAR name = "isModeledTwoWay">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "NominalStored">
                                                                            <REAL>0.007096774193548401</REAL>
                                                                        </VAR>
                                                                        <VAR name = "Constant">
                                                                            <REAL>0.007096774193548401</REAL>
                                                                        </VAR>
                                                                        <VAR name = "InitialEstimate">
                                                                            <REAL>0</REAL>
                                                                        </VAR>
                                                                        <VAR name = "SigmaStored">
                                                                            <REAL>0.05</REAL>
                                                                        </VAR>
                                                                        <VAR name = "Sigma">
                                                                            <REAL>0.05</REAL>
                                                                        </VAR>
                                                                        <VAR name = "HalfLife">
                                                                            <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                                <REAL>10080</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "DensityCorrSigma">
                                                            <REAL>0.3</REAL>
                                                        </VAR>
                                                        <VAR name = "DensityCorrHalfLife">
                                                            <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                <REAL>90</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "DensityCorrInitialEstimate">
                                                            <REAL>0</REAL>
                                                        </VAR>
                                                        <VAR name = "DensityCorrSigmaScale">
                                                            <REAL>1</REAL>
                                                        </VAR>
                                                        <VAR name = "DensityRatioRoot">
                                                            <REAL>1</REAL>
                                                        </VAR>
                                                        <VAR name = "DensityRatioIncreaseThreshold">
                                                            <REAL>0.1</REAL>
                                                        </VAR>
                                                        <VAR name = "SunPosMethod">
                                                            <STRING>&quot;ApparentToTrueCB&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "UseInVariationalEquations">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "AddProcessNoise">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "OutOfPlaneFraction">
                                                            <REAL>0.3</REAL>
                                                        </VAR>
                                                        <VAR name = "InPlaneFraction">
                                                            <REAL>0.3</REAL>
                                                        </VAR>
                                                        <VAR name = "Initialization">
                                                            <SCOPE>
                                                                <VAR name = "Duration">
                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                        <REAL>0</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "DensityCorrSigma">
                                                                    <REAL>10</REAL>
                                                                </VAR>
                                                                <VAR name = "DensityCorrHalfLife">
                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                        <REAL>28800</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "SolarPressure">
                                                    <SCOPE>
                                                        <VAR name = "Use">
                                                            <STRING>&quot;No&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "EstimateSRP">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                        <VAR name = "Model">
                                                            <PROP name = "Type">
                                                                <STRING>&quot;Spherical&quot;</STRING>
                                                            </PROP>
                                                            <SCOPE Class = "SCOPE">
                                                                <VAR name = "SpecMethod">
                                                                    <STRING>&quot;Mass Area Cr&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "CorrectionType">
                                                                    <STRING>&quot;Cr Additive&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "Cr">
                                                                    <REAL>1</REAL>
                                                                </VAR>
                                                                <VAR name = "Area">
                                                                    <QUANTITY Dimension = "Area" Unit = "m^2">
                                                                        <REAL>1.1</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "CrAoverM">
                                                                    <REAL>0.003225806451612904</REAL>
                                                                </VAR>
                                                                <VAR name = "CrModel">
                                                                    <PROP name = "Type">
                                                                        <STRING>&quot;GaussMarkov&quot;</STRING>
                                                                    </PROP>
                                                                    <SCOPE>
                                                                        <VAR name = "isModeledTwoWay">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "NominalStored">
                                                                            <REAL>1</REAL>
                                                                        </VAR>
                                                                        <VAR name = "Constant">
                                                                            <REAL>1</REAL>
                                                                        </VAR>
                                                                        <VAR name = "InitialEstimate">
                                                                            <REAL>0</REAL>
                                                                        </VAR>
                                                                        <VAR name = "SigmaStored">
                                                                            <REAL>0.4</REAL>
                                                                        </VAR>
                                                                        <VAR name = "Sigma">
                                                                            <REAL>0.4</REAL>
                                                                        </VAR>
                                                                        <VAR name = "HalfLife">
                                                                            <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                                <REAL>2880</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "ReflectionModel">
                                                                    <STRING>&quot;Sphere with diffuse reflection&quot;</STRING>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "SunPosMethod">
                                                            <STRING>&quot;ApparentToTrueCB&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "EclipsingBodies">
                                                            <LIST>
                                                                <VAR name = "Planet">
                                                                    <STRING>&quot;Moon&quot;</STRING>
                                                                </VAR>
                                                            </LIST>
                                                        </VAR>
                                                        <VAR name = "BoundaryMitigation">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "UseInVariationalEquations">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                        <VAR name = "AddProcessNoise">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "EclipticNorthFraction">
                                                            <REAL>0.3</REAL>
                                                        </VAR>
                                                        <VAR name = "EclipticPlaneFraction">
                                                            <REAL>0.1</REAL>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "CentralBodyRadiation">
                                                    <SCOPE>
                                                        <VAR name = "Albedo">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "ThermalRadiationPressure">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "Ck">
                                                            <REAL>1</REAL>
                                                        </VAR>
                                                        <VAR name = "Area">
                                                            <QUANTITY Dimension = "Area" Unit = "m^2">
                                                                <REAL>20</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "Plugin">
                                                    <SCOPE>
                                                        <VAR name = "Use">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "PluginID">
                                                            <STRING>&quot;&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "PluginConfig">
                                                            <SCOPE />
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "UnmodeledAccelerations">
                                                    <SCOPE>
                                                        <VAR name = "ProcessNoise">
                                                            <SCOPE>
                                                                <VAR name = "RadialVelocitySigma">
                                                                    <QUANTITY Dimension = "SlowRate" Unit = "cm*sec^-1">
                                                                        <REAL>0</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "IntrackVelocitySigma">
                                                                    <QUANTITY Dimension = "SlowRate" Unit = "cm*sec^-1">
                                                                        <REAL>0</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "CrosstrackVelocitySigma">
                                                                    <QUANTITY Dimension = "SlowRate" Unit = "cm*sec^-1">
                                                                        <REAL>0</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "TimeInterval">
                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                        <REAL>2</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "UseSquaredTimeFormulation">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "InstantManeuvers">
                                                    <LIST />
                                                </VAR>
                                                <VAR name = "PermanentManeuverStates">
                                                    <LIST />
                                                </VAR>
                                                <VAR name = "FiniteManeuvers">
                                                    <LIST />
                                                </VAR>
                                                <VAR name = "EmpiricalForces">
                                                    <LIST />
                                                </VAR>
                                                <VAR name = "OrbitErrorTransitionMethod">
                                                    <STRING>&quot;VariationalEquations&quot;</STRING>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "PropagatorControls">
                                            <SCOPE Class = "PropagatorControls">
                                                <VAR name = "IntegrationMethod">
                                                    <STRING>&quot;RKF 7(8)&quot;</STRING>
                                                </VAR>
                                                <VAR name = "UseVOP">
                                                    <BOOL>true</BOOL>
                                                </VAR>
                                                <VAR name = "MinimumAltitude">
                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                                        <REAL>0</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "StepSize">
                                                    <SCOPE Class = "StepSize">
                                                        <VAR name = "StepControlMethod">
                                                            <STRING>&quot;RelativeError&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "Time">
                                                            <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                <REAL>0.5</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "TrueAnomaly">
                                                            <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                <REAL>2</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "EccentricityThreshold">
                                                            <REAL>0.04</REAL>
                                                        </VAR>
                                                        <VAR name = "ErrorTolerance">
                                                            <REAL>1e-15</REAL>
                                                        </VAR>
                                                        <VAR name = "MinStepSize">
                                                            <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                <REAL>1</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "MaxStepSize">
                                                            <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                <REAL>600</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "Predict">
                                                    <SCOPE Class = "Predict">
                                                        <VAR name = "Enabled">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "IntegrationMethod">
                                                            <STRING>&quot;RKF 7(8)&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "UseVOP">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                        <VAR name = "PredictorCorrectorScheme">
                                                            <STRING>&quot;Full Correction&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "MaxCorrectorIterations">
                                                            <INT>3</INT>
                                                        </VAR>
                                                        <VAR name = "StepSize">
                                                            <SCOPE Class = "StepSize">
                                                                <VAR name = "StepControlMethod">
                                                                    <STRING>&quot;RelativeError&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "Time">
                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                        <REAL>0.5</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "TrueAnomaly">
                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                        <REAL>2</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "EccentricityThreshold">
                                                                    <REAL>0.04</REAL>
                                                                </VAR>
                                                                <VAR name = "ErrorTolerance">
                                                                    <REAL>1e-13</REAL>
                                                                </VAR>
                                                                <VAR name = "MinStepSize">
                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                        <REAL>1</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "MaxStepSize">
                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                        <REAL>86400</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "EphemerisGeneration">
                                            <SCOPE>
                                                <VAR name = "StartTime">
                                                    <DATE>29 Jan 1995 02:39:06.000</DATE>
                                                </VAR>
                                                <VAR name = "Span">
                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                        <REAL>100</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "TimeStep">
                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                        <REAL>5</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "AlignTimeGrid">
                                                    <BOOL>true</BOOL>
                                                </VAR>
                                                <VAR name = "CoordFrame">
                                                    <STRING>&quot;J2000&quot;</STRING>
                                                </VAR>
                                                <VAR name = "Acceleration">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                                <VAR name = "Covariance">
                                                    <BOOL>true</BOOL>
                                                </VAR>
                                                <VAR name = "CovarianceType">
                                                    <STRING>&quot;Position 3x3 Covariance&quot;</STRING>
                                                </VAR>
                                                <VAR name = "CovarianceCoordFrame">
                                                    <STRING>&quot;SameAsEphemeris&quot;</STRING>
                                                </VAR>
                                                <VAR name = "StateErrorTransition">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                                <VAR name = "CreateFile">
                                                    <BOOL>true</BOOL>
                                                </VAR>
                                                <VAR name = "FileFormat">
                                                    <STRING>&quot;STK Ephemeris&quot;</STRING>
                                                </VAR>
                                                <VAR name = "Filename">
                                                    <STRING>&quot;C:\Users\dvallado\Documents\ODTK 7\Ephemeris\Sat7734.e&quot;</STRING>
                                                </VAR>
                                                <VAR name = "SendToScript">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                                <VAR name = "ScriptFilename">
                                                    <STRING>&quot;&quot;</STRING>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "OrbitUncertainty">
                                            <SCOPE>
                                                <VAR name = "R_sigma">
                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                        <REAL>500</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "I_sigma">
                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                        <REAL>1000</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "C_sigma">
                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                        <REAL>200</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "Rdot_sigma">
                                                    <QUANTITY Dimension = "Rate" Unit = "m*sec^-1">
                                                        <REAL>0.6</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "Idot_sigma">
                                                    <QUANTITY Dimension = "Rate" Unit = "m*sec^-1">
                                                        <REAL>0.4</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "Cdot_sigma">
                                                    <QUANTITY Dimension = "Rate" Unit = "m*sec^-1">
                                                        <REAL>0.2</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "RI_correlation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "RC_correlation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "RRdot_correlation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "RIdot_correlation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "RCdot_correlation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "IC_correlation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "IRdot_correlation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "IIdot_correlation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "ICdot_correlation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "CRdot_correlation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "CIdot_correlation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "CCdot_correlation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "RdotIdot_correlation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "RdotCdot_correlation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "IdotCdot_correlation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "LocationUncertainty">
                                            <SCOPE>
                                                <VAR name = "SouthSigma">
                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                        <REAL>1000</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "EastSigma">
                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                        <REAL>1000</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "AltitudeSigma">
                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                        <REAL>200</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "SouthEastCorrelation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "SouthAltCorrelation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "EastAltCorrelation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "Clock">
                                            <SCOPE Class = "Clock">
                                                <VAR name = "Settings">
                                                    <SCOPE Class = "Clock">
                                                        <VAR name = "Enabled">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "Estimate">
                                                            <SCOPE Class = "Estimate">
                                                                <VAR name = "Phase">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                                <VAR name = "Freq">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                                <VAR name = "Aging">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "ClockControls">
                                                            <SCOPE Class = "ClockControls">
                                                                <VAR name = "PhaseBias">
                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                        <REAL>0</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "FreqBias">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "AgingBias">
                                                                    <QUANTITY Dimension = "Unitless Per Time" Unit = "sec*day^-2">
                                                                        <REAL>0</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "A0">
                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                        <REAL>3e-21</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "Aminus1">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "Aminus2">
                                                                    <QUANTITY Dimension = "Unitless Per Time" Unit = "sec^-1">
                                                                        <REAL>1.225e-31</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "AgingWN">
                                                                    <QUANTITY Dimension = "TimeUnit-3" Unit = "sec^-3">
                                                                        <REAL>0</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "ClockUncertainty">
                                                            <SCOPE>
                                                                <VAR name = "Phase_sigma">
                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                        <REAL>1e-06</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "Freq_sigma">
                                                                    <REAL>1e-07</REAL>
                                                                </VAR>
                                                                <VAR name = "Aging_sigma">
                                                                    <QUANTITY Dimension = "Unitless Per Time" Unit = "sec*day^-2">
                                                                        <REAL>1e-05</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "PhaseFreq_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "PhaseAging_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "FreqAging_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "OrbitClockCorrelations">
                                                            <SCOPE>
                                                                <VAR name = "RPhase_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "RFreq_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "RAging_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "IPhase_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "IFreq_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "IAging_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "CPhase_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "CFreq_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "CAging_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "RdotPhase_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "RdotFreq_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "RdotAging_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "IdotPhase_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "IdotFreq_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "IdotAging_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "CdotPhase_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "CdotFreq_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "CdotAging_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "FilterEvents">
                                            <SCOPE>
                                                <VAR name = "MeasurementRejectThreshold">
                                                    <SCOPE>
                                                        <VAR name = "NumForWarning">
                                                            <INT>0</INT>
                                                        </VAR>
                                                        <VAR name = "NumForAlert">
                                                            <INT>0</INT>
                                                        </VAR>
                                                        <VAR name = "OnWarning">
                                                            <STRING>&quot;C:\Program Files\AGI\ODTK 7\ODTK\AppData\Scripts\Event_Controls\DoNothing.vbs&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "OnReturnFromWarning">
                                                            <STRING>&quot;C:\Program Files\AGI\ODTK 7\ODTK\AppData\Scripts\Event_Controls\DoNothing.vbs&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "OnAlert">
                                                            <STRING>&quot;C:\Program Files\AGI\ODTK 7\ODTK\AppData\Scripts\Event_Controls\DoNothing.vbs&quot;</STRING>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "MeasurementAcceptTimer">
                                                    <SCOPE>
                                                        <VAR name = "TimeGapForWarning">
                                                            <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                <REAL>0</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "TimeGapForAlert">
                                                            <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                <REAL>0</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "OnWarning">
                                                            <STRING>&quot;C:\Program Files\AGI\ODTK 7\ODTK\AppData\Scripts\Event_Controls\DoNothing.vbs&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "OnReturnFromWarning">
                                                            <STRING>&quot;C:\Program Files\AGI\ODTK 7\ODTK\AppData\Scripts\Event_Controls\DoNothing.vbs&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "OnAlert">
                                                            <STRING>&quot;C:\Program Files\AGI\ODTK 7\ODTK\AppData\Scripts\Event_Controls\DoNothing.vbs&quot;</STRING>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "MeasTimeBias">
                                            <SCOPE>
                                                <VAR name = "Estimate">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                                <VAR name = "TimeBiasModel">
                                                    <PROP name = "Type">
                                                        <STRING>&quot;RandomWalk&quot;</STRING>
                                                    </PROP>
                                                    <SCOPE>
                                                        <VAR name = "isModeledTwoWay">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "InitialEstimateStored">
                                                            <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                <REAL>0</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "Constant">
                                                            <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                <REAL>0</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "InitialEstimate">
                                                            <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                <REAL>0</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "InitialSigmaStored">
                                                            <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                <REAL>0.001</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "InitialSigma">
                                                            <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                <REAL>0.001</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "DiffusionCoefficient">
                                                            <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                <REAL>9.999999999999999e-12</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "Attachments">
                                            <SCOPE>
                                                <VAR name = "Role">
                                                    <STRING>&quot;None&quot;</STRING>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "CCSDS">
                                            <SCOPE>
                                                <VAR name = "ObjName">
                                                    <STRING>&quot;Sat7734&quot;</STRING>
                                                </VAR>
                                                <VAR name = "ObjId">
                                                    <STRING>&quot;2000-000A&quot;</STRING>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "SPICE">
                                            <SCOPE>
                                                <VAR name = "ID">
                                                    <INT>-10</INT>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "Children">
                                            <SCOPE>
                                                <VAR name = "LeastSquares">
                                                    <SCOPE>
                                                        <VAR name = "LeastSquares1">
                                                            <SCOPE Class = "LeastSquares">
                                                                <PROP name = "version">
                                                                    <STRING>&quot;7.7&quot;</STRING>
                                                                </PROP>
                                                                <VAR name = "Description">
                                                                    <STRING>&quot;&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "RelaySatList">
                                                                    <PROP name = "EmptyDescription">
                                                                        <STRING>&quot;An empty list allows all satellites to be used&quot;</STRING>
                                                                    </PROP>
                                                                    <SETLINKTOOBJ />
                                                                </VAR>
                                                                <VAR name = "TrackerList">
                                                                    <PROP name = "EmptyDescription">
                                                                        <STRING>&quot;An empty list allows all trackers to be used&quot;</STRING>
                                                                    </PROP>
                                                                    <SETLINKTOOBJ />
                                                                </VAR>
                                                                <VAR name = "EmitterList">
                                                                    <PROP name = "EmptyDescription">
                                                                        <STRING>&quot;An empty list allows all emitters to be used&quot;</STRING>
                                                                    </PROP>
                                                                    <SETLINKTOOBJ />
                                                                </VAR>
                                                                <VAR name = "MeasTypes">
                                                                    <PROP name = "EmptyDescription">
                                                                        <STRING>&quot;An empty list allows all measurement types to be processed&quot;</STRING>
                                                                    </PROP>
                                                                    <LIST>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;Range&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;Doppler&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;1W Bistatic Range&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;NP Range&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;Azimuth&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;Elevation&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;X Angle&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;Y Angle&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;DirCos East&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;DirCos North&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;Right Ascension&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;Declination&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;SB Right Ascension&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;SB Declination&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;SB Range&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;SB Azimuth&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;SB Elevation&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;L1 Phase&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;L2 Phase&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;CA Pseudo-range&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;P1 Pseudo-range&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;P2 Pseudo-range&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;LA Phase&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;CA SD Pseudo-range&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;DF Pseudo-range&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;DF SD Pseudo-range&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;L1 SD Phase&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;L2 SD Phase&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;LA SD Phase&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;DF Phase&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;DF SD Phase&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;2L CA Pseudo-range&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;CA DD Pseudo-range&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;DF DD Pseudo-range&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;L1 DD Phase&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;DF DD Phase&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;CA Nav Sol&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;DF Nav Sol&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;4L Range&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;5L Doppler&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;BRTS Range&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;BRTS Doppler&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;3L Doppler&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;TDOA&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;SD TDOA&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;TDOA Dot&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;FDOA&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;SD FDOA&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;SB TDOA&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;SB TDOA Dot&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;SB FDOA&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;GroundTDOA&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;GroundFDOA&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;Eph Pos&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;Eph Vel&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;DSN Doppler&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;DSN 3W Doppler&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;DSN TCP&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;DSN 3W TCP&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;DSN Seq Rng&quot;</STRING>
                                                                        </VAR>
                                                                    </LIST>
                                                                </VAR>
                                                                <VAR name = "CalcNumMeasurements">
                                                                    <BOOL>true</BOOL>
                                                                </VAR>
                                                                <VAR name = "Stages">
                                                                    <LIST>
                                                                        <SCOPE Class = "LSControls">
                                                                            <VAR name = "StartTime">
                                                                                <DATE>29 Jan 1995 02:39:06.000</DATE>
                                                                            </VAR>
                                                                            <VAR name = "StopTime">
                                                                                <DATE>29 Jan 1995 02:40:56.000</DATE>
                                                                            </VAR>
                                                                            <VAR name = "DataFrequency">
                                                                                <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                                    <REAL>0</REAL>
                                                                                </QUANTITY>
                                                                            </VAR>
                                                                            <VAR name = "EstimateBCoeff">
                                                                                <BOOL>false</BOOL>
                                                                            </VAR>
                                                                            <VAR name = "EstimateCr">
                                                                                <BOOL>false</BOOL>
                                                                            </VAR>
                                                                            <VAR name = "EstimateTransBias">
                                                                                <BOOL>false</BOOL>
                                                                            </VAR>
                                                                            <VAR name = "EstimateMeasBias">
                                                                                <BOOL>false</BOOL>
                                                                            </VAR>
                                                                            <VAR name = "MaxIterations">
                                                                                <INT>10</INT>
                                                                            </VAR>
                                                                            <VAR name = "RMSConvergenceCriteria">
                                                                                <REAL>0.001</REAL>
                                                                            </VAR>
                                                                            <VAR name = "SigmaEdit">
                                                                                <BOOL>true</BOOL>
                                                                            </VAR>
                                                                            <VAR name = "Sigma">
                                                                                <REAL>3</REAL>
                                                                            </VAR>
                                                                            <VAR name = "InitialEdit">
                                                                                <BOOL>false</BOOL>
                                                                            </VAR>
                                                                            <VAR name = "StateCorrection">
                                                                                <STRING>&quot;Pos and Vel&quot;</STRING>
                                                                            </VAR>
                                                                        </SCOPE>
                                                                    </LIST>
                                                                </VAR>
                                                                <VAR name = "ProcessControl">
                                                                    <SCOPE Class = "ProcessControl">
                                                                        <VAR name = "StartMode">
                                                                            <STRING>&quot;Initial&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "SelectedRestartTime">
                                                                            <STRING>&quot;29 Jan 1995 02:38:37.000 UTCG&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "AutoSelectedRestartTime">
                                                                            <STRING>&quot;29 Jan 1995 02:38:37.000 UTCG&quot;</STRING>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "StartFromLastSolution">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                                <VAR name = "IsLastLSSolutionAvailable">
                                                                    <BOOL>true</BOOL>
                                                                </VAR>
                                                                <VAR name = "FinalSigmaEditIteration">
                                                                    <INT>100</INT>
                                                                </VAR>
                                                                <VAR name = "Restart">
                                                                    <SCOPE>
                                                                        <VAR name = "SaveRecordsToFile">
                                                                            <BOOL>true</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "MaxRecordsInFile">
                                                                            <INT>100</INT>
                                                                        </VAR>
                                                                        <VAR name = "BackupRestartRecords">
                                                                            <BOOL>true</BOOL>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "CustomDataEditing">
                                                                    <SCOPE Class = "CustomDataEditing">
                                                                        <VAR name = "Enabled">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "OverrideValidity">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "Schedule">
                                                                            <LIST />
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "ResidualEditing">
                                                                    <SCOPE Class = "ResidualEditing">
                                                                        <VAR name = "Enabled">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "Schedule">
                                                                            <LIST />
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "OrbitStateUpdateRepresentation">
                                                                    <STRING>&quot;Cartesian&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "SolveForMethod">
                                                                    <STRING>&quot;QR&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "CombineMeasUncertainty">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                                <VAR name = "LineSearch">
                                                                    <SCOPE>
                                                                        <VAR name = "Method">
                                                                            <STRING>&quot;None&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Fraction">
                                                                            <REAL>0.5</REAL>
                                                                        </VAR>
                                                                        <VAR name = "DampingControl">
                                                                            <STRING>&quot;GainRatio&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "DampingFactor">
                                                                            <REAL>0.001</REAL>
                                                                        </VAR>
                                                                        <VAR name = "AcceptDampingFactor">
                                                                            <REAL>3</REAL>
                                                                        </VAR>
                                                                        <VAR name = "RejectDampingFactor">
                                                                            <REAL>5</REAL>
                                                                        </VAR>
                                                                        <VAR name = "MaxOrbitChange">
                                                                            <REAL>0.001</REAL>
                                                                        </VAR>
                                                                        <VAR name = "MaxTrys">
                                                                            <INT>10</INT>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "EpochControl">
                                                                    <SCOPE Class = "EpochControl">
                                                                        <VAR name = "EpochLocation">
                                                                            <STRING>&quot;Beginning&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "SolutionEpoch">
                                                                            <DATE>29 Jan 1995 02:39:06.000</DATE>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "UseAprioriCovariance">
                                                                    <SCOPE Class = "AprioriCovariance">
                                                                        <VAR name = "PositionVelocity">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "Drag">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "SRP">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "TransBias">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "MeasBias">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "ConsiderStates">
                                                                    <SCOPE Class = "ConsiderCov">
                                                                        <VAR name = "Drag">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "SolarPressure">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "TransBias">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "MeasBias">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "CheckForDivergence">
                                                                    <BOOL>true</BOOL>
                                                                </VAR>
                                                                <VAR name = "NumDivergingIterations">
                                                                    <INT>2</INT>
                                                                </VAR>
                                                                <VAR name = "CheckConditionNumber">
                                                                    <BOOL>true</BOOL>
                                                                </VAR>
                                                                <VAR name = "MaxIterationsStatus">
                                                                    <STRING>&quot;Failure&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "AbsoluteRMSChecks">
                                                                    <SCOPE Class = "AbsoluteRMSChecks">
                                                                        <VAR name = "Enabled">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "AcceptableRMS">
                                                                            <REAL>10</REAL>
                                                                        </VAR>
                                                                        <VAR name = "ConvergedRMS">
                                                                            <REAL>0.001</REAL>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "MotionModel">
                                                                    <STRING>&quot;Orbiter&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "Output">
                                                                    <SCOPE Class = "Output">
                                                                        <VAR name = "Filename">
                                                                            <STRING>&quot;C:\Users\dvallado\Documents\ODTK 7\DataArchive\Sat7734.lsrun&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "ResidualArchiving">
                                                                            <STRING>&quot;All Iterations&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "OutputStateHistory">
                                                                            <STRING>&quot;Last Iteration&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "SuccessfulRun">
                                                                            <BOOL>true</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "OrbitState">
                                                                            <PROP name = "DisplayCoordFlag">
                                                                                <STRING>&quot;Cartesian&quot;</STRING>
                                                                            </PROP>
                                                                            <SCOPE Class = "Cartesian">
                                                                                <VAR name = "CentralBody">
                                                                                    <STRING>&quot;Earth&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "CoordFrame">
                                                                                    <STRING>&quot;J2000&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "Epoch">
                                                                                    <DATE>29 Jan 1995 02:39:06.000</DATE>
                                                                                </VAR>
                                                                                <VAR name = "XPosition">
                                                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                                                                        <REAL>5746.469218358086</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "YPosition">
                                                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                                                                        <REAL>2679.94436300598</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "ZPosition">
                                                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                                                                        <REAL>3442.416172101777</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "XVelocity">
                                                                                    <QUANTITY Dimension = "Rate" Unit = "km*sec^-1">
                                                                                        <REAL>4.339936292548356</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "YVelocity">
                                                                                    <QUANTITY Dimension = "Rate" Unit = "km*sec^-1">
                                                                                        <REAL>-1.918663484840863</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "ZVelocity">
                                                                                    <QUANTITY Dimension = "Rate" Unit = "km*sec^-1">
                                                                                        <REAL>-5.721869225615462</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                            </SCOPE>
                                                                        </VAR>
                                                                        <VAR name = "OrbitUncertainty">
                                                                            <SCOPE>
                                                                                <VAR name = "R_sigma">
                                                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                        <REAL>232.2673019260342</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "I_sigma">
                                                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                        <REAL>278.4010848498702</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "C_sigma">
                                                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                        <REAL>322.437930051097</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "Rdot_sigma">
                                                                                    <QUANTITY Dimension = "Rate" Unit = "m*sec^-1">
                                                                                        <REAL>3.214955222975796</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "Idot_sigma">
                                                                                    <QUANTITY Dimension = "Rate" Unit = "m*sec^-1">
                                                                                        <REAL>3.950353762364416</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "Cdot_sigma">
                                                                                    <QUANTITY Dimension = "Rate" Unit = "m*sec^-1">
                                                                                        <REAL>4.164400663501679</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "RI_correlation">
                                                                                    <REAL>0.3015580421036973</REAL>
                                                                                </VAR>
                                                                                <VAR name = "RC_correlation">
                                                                                    <REAL>-0.3852986639121643</REAL>
                                                                                </VAR>
                                                                                <VAR name = "RRdot_correlation">
                                                                                    <REAL>-0.8804263605648522</REAL>
                                                                                </VAR>
                                                                                <VAR name = "RIdot_correlation">
                                                                                    <REAL>-0.2098115587922804</REAL>
                                                                                </VAR>
                                                                                <VAR name = "RCdot_correlation">
                                                                                    <REAL>0.397831496952491</REAL>
                                                                                </VAR>
                                                                                <VAR name = "IC_correlation">
                                                                                    <REAL>0.7114677013872222</REAL>
                                                                                </VAR>
                                                                                <VAR name = "IRdot_correlation">
                                                                                    <REAL>-0.2444281106639316</REAL>
                                                                                </VAR>
                                                                                <VAR name = "IIdot_correlation">
                                                                                    <REAL>-0.7883385409810574</REAL>
                                                                                </VAR>
                                                                                <VAR name = "ICdot_correlation">
                                                                                    <REAL>-0.6062930842198866</REAL>
                                                                                </VAR>
                                                                                <VAR name = "CRdot_correlation">
                                                                                    <REAL>0.3636282578579635</REAL>
                                                                                </VAR>
                                                                                <VAR name = "CIdot_correlation">
                                                                                    <REAL>-0.5178832012200121</REAL>
                                                                                </VAR>
                                                                                <VAR name = "CCdot_correlation">
                                                                                    <REAL>-0.8755092113538776</REAL>
                                                                                </VAR>
                                                                                <VAR name = "RdotIdot_correlation">
                                                                                    <REAL>0.2119613608771084</REAL>
                                                                                </VAR>
                                                                                <VAR name = "RdotCdot_correlation">
                                                                                    <REAL>-0.502657710738232</REAL>
                                                                                </VAR>
                                                                                <VAR name = "IdotCdot_correlation">
                                                                                    <REAL>0.6316641513030097</REAL>
                                                                                </VAR>
                                                                            </SCOPE>
                                                                        </VAR>
                                                                        <VAR name = "LocationUncertainty">
                                                                            <SCOPE>
                                                                                <VAR name = "SouthSigma">
                                                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                        <REAL>232.2673019260342</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "EastSigma">
                                                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                        <REAL>278.4010848498702</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "AltitudeSigma">
                                                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                        <REAL>322.437930051097</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "SouthEastCorrelation">
                                                                                    <REAL>0.3015580421036973</REAL>
                                                                                </VAR>
                                                                                <VAR name = "SouthAltCorrelation">
                                                                                    <REAL>-0.3852986639121643</REAL>
                                                                                </VAR>
                                                                                <VAR name = "EastAltCorrelation">
                                                                                    <REAL>0.7114677013872222</REAL>
                                                                                </VAR>
                                                                            </SCOPE>
                                                                        </VAR>
                                                                        <VAR name = "BallisticCoeffNominal">
                                                                            <REAL>0.0070967741935484</REAL>
                                                                        </VAR>
                                                                        <VAR name = "CPNominal">
                                                                            <REAL>1</REAL>
                                                                        </VAR>
                                                                        <VAR name = "ForceModelList">
                                                                            <LIST>
                                                                                <VAR name = "ForceModelList">
                                                                                    <SCOPE>
                                                                                        <VAR name = "Type">
                                                                                            <STRING>&quot;BallisticCoefficient&quot;</STRING>
                                                                                        </VAR>
                                                                                        <VAR name = "Name">
                                                                                            <STRING>&quot;B_Relative&quot;</STRING>
                                                                                        </VAR>
                                                                                        <VAR name = "Estimated">
                                                                                            <BOOL>false</BOOL>
                                                                                        </VAR>
                                                                                        <VAR name = "Nominal">
                                                                                            <REAL>0.0070967741935484</REAL>
                                                                                        </VAR>
                                                                                        <VAR name = "LSCorrection">
                                                                                            <REAL>0</REAL>
                                                                                        </VAR>
                                                                                        <VAR name = "Total">
                                                                                            <REAL>0.0070967741935484</REAL>
                                                                                        </VAR>
                                                                                        <VAR name = "Sigma">
                                                                                            <REAL>0.05</REAL>
                                                                                        </VAR>
                                                                                    </SCOPE>
                                                                                </VAR>
                                                                                <VAR name = "ForceModelList">
                                                                                    <SCOPE>
                                                                                        <VAR name = "Type">
                                                                                            <STRING>&quot;SolarPressure&quot;</STRING>
                                                                                        </VAR>
                                                                                        <VAR name = "Name">
                                                                                            <STRING>&quot;Cr_Additive&quot;</STRING>
                                                                                        </VAR>
                                                                                        <VAR name = "Estimated">
                                                                                            <BOOL>false</BOOL>
                                                                                        </VAR>
                                                                                        <VAR name = "Nominal">
                                                                                            <REAL>1</REAL>
                                                                                        </VAR>
                                                                                        <VAR name = "LSCorrection">
                                                                                            <REAL>0</REAL>
                                                                                        </VAR>
                                                                                        <VAR name = "Total">
                                                                                            <REAL>1</REAL>
                                                                                        </VAR>
                                                                                        <VAR name = "Sigma">
                                                                                            <REAL>0.4</REAL>
                                                                                        </VAR>
                                                                                    </SCOPE>
                                                                                </VAR>
                                                                            </LIST>
                                                                        </VAR>
                                                                        <VAR name = "TransBiasList">
                                                                            <LIST />
                                                                        </VAR>
                                                                        <VAR name = "MeasBiasList">
                                                                            <LIST />
                                                                        </VAR>
                                                                        <VAR name = "StatesToTransfer">
                                                                            <SCOPE Class = "StatesToTransfer">
                                                                                <VAR name = "PositionVelocity">
                                                                                    <BOOL>true</BOOL>
                                                                                </VAR>
                                                                                <VAR name = "Drag">
                                                                                    <BOOL>true</BOOL>
                                                                                </VAR>
                                                                                <VAR name = "SolarPressure">
                                                                                    <BOOL>true</BOOL>
                                                                                </VAR>
                                                                                <VAR name = "PosVelCovariance">
                                                                                    <BOOL>false</BOOL>
                                                                                </VAR>
                                                                                <VAR name = "PosCovSigmaScaling">
                                                                                    <REAL>1</REAL>
                                                                                </VAR>
                                                                                <VAR name = "VelCovSigmaScaling">
                                                                                    <REAL>1</REAL>
                                                                                </VAR>
                                                                                <VAR name = "EpochLocation">
                                                                                    <STRING>&quot;Solution Epoch&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "SolutionEpoch">
                                                                                    <DATE>29 Jan 1995 02:39:06.000</DATE>
                                                                                </VAR>
                                                                            </SCOPE>
                                                                        </VAR>
                                                                        <VAR name = "STKEphemeris">
                                                                            <SCOPE>
                                                                                <VAR name = "DuringProcess">
                                                                                    <SCOPE>
                                                                                        <VAR name = "Generate">
                                                                                            <BOOL>false</BOOL>
                                                                                        </VAR>
                                                                                        <VAR name = "TimeGrid">
                                                                                            <STRING>&quot;Uniform&quot;</STRING>
                                                                                        </VAR>
                                                                                        <VAR name = "MaxTimeStep">
                                                                                            <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                                                <REAL>2</REAL>
                                                                                            </QUANTITY>
                                                                                        </VAR>
                                                                                        <VAR name = "UniformTimeStep">
                                                                                            <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                                                <REAL>2</REAL>
                                                                                            </QUANTITY>
                                                                                        </VAR>
                                                                                    </SCOPE>
                                                                                </VAR>
                                                                                <VAR name = "Predict">
                                                                                    <SCOPE>
                                                                                        <VAR name = "Generate">
                                                                                            <BOOL>false</BOOL>
                                                                                        </VAR>
                                                                                        <VAR name = "TimeStep">
                                                                                            <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                                                <REAL>1</REAL>
                                                                                            </QUANTITY>
                                                                                        </VAR>
                                                                                        <VAR name = "AlignTimeGrid">
                                                                                            <BOOL>true</BOOL>
                                                                                        </VAR>
                                                                                        <VAR name = "StopMode">
                                                                                            <STRING>&quot;TimeSpan&quot;</STRING>
                                                                                        </VAR>
                                                                                        <VAR name = "TimeSpan">
                                                                                            <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                                                <REAL>720</REAL>
                                                                                            </QUANTITY>
                                                                                        </VAR>
                                                                                        <VAR name = "StopTime">
                                                                                            <DATE>29 Jan 1995 14:39:06.000</DATE>
                                                                                        </VAR>
                                                                                    </SCOPE>
                                                                                </VAR>
                                                                                <VAR name = "EphemerisArchiving">
                                                                                    <STRING>&quot;Final Iteration&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "CoordFrame">
                                                                                    <LIST>
                                                                                        <VAR name = "SatCoordFrameList">
                                                                                            <SCOPE>
                                                                                                <VAR name = "Satellite">
                                                                                                    <LINKTOOBJ>
                                                                                                        <STRING>&quot;Sat7734&quot;</STRING>
                                                                                                    </LINKTOOBJ>
                                                                                                </VAR>
                                                                                                <VAR name = "CBName">
                                                                                                    <STRING>&quot;Earth&quot;</STRING>
                                                                                                </VAR>
                                                                                                <VAR name = "CoordFrame">
                                                                                                    <STRING>&quot;J2000&quot;</STRING>
                                                                                                </VAR>
                                                                                            </SCOPE>
                                                                                        </VAR>
                                                                                    </LIST>
                                                                                </VAR>
                                                                                <VAR name = "Acceleration">
                                                                                    <BOOL>false</BOOL>
                                                                                </VAR>
                                                                                <VAR name = "Covariance">
                                                                                    <BOOL>false</BOOL>
                                                                                </VAR>
                                                                                <VAR name = "CovarianceType">
                                                                                    <STRING>&quot;Position 3x3 Covariance&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "CovarianceCoordFrame">
                                                                                    <STRING>&quot;SameAsEphemeris&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "StateErrorTransition">
                                                                                    <BOOL>false</BOOL>
                                                                                </VAR>
                                                                                <VAR name = "FileFormat">
                                                                                    <STRING>&quot;STK Ephemeris&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "OutputDirectory">
                                                                                    <STRING>&quot;C:\Users\dvallado\Documents\ODTK 7\Ephemeris&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "FileNamingOption">
                                                                                    <STRING>&quot;ProcessStart&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "Files">
                                                                                    <LIST />
                                                                                </VAR>
                                                                            </SCOPE>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "Children">
                                                                    <SCOPE />
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "LeastSquaresLong">
                                                            <SCOPE Class = "LeastSquares">
                                                                <PROP name = "version">
                                                                    <STRING>&quot;7.7&quot;</STRING>
                                                                </PROP>
                                                                <VAR name = "Description">
                                                                    <STRING>&quot;&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "RelaySatList">
                                                                    <PROP name = "EmptyDescription">
                                                                        <STRING>&quot;An empty list allows all satellites to be used&quot;</STRING>
                                                                    </PROP>
                                                                    <SETLINKTOOBJ />
                                                                </VAR>
                                                                <VAR name = "TrackerList">
                                                                    <PROP name = "EmptyDescription">
                                                                        <STRING>&quot;An empty list allows all trackers to be used&quot;</STRING>
                                                                    </PROP>
                                                                    <SETLINKTOOBJ />
                                                                </VAR>
                                                                <VAR name = "EmitterList">
                                                                    <PROP name = "EmptyDescription">
                                                                        <STRING>&quot;An empty list allows all emitters to be used&quot;</STRING>
                                                                    </PROP>
                                                                    <SETLINKTOOBJ />
                                                                </VAR>
                                                                <VAR name = "MeasTypes">
                                                                    <PROP name = "EmptyDescription">
                                                                        <STRING>&quot;An empty list allows all measurement types to be processed&quot;</STRING>
                                                                    </PROP>
                                                                    <LIST>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;Range&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;Doppler&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;1W Bistatic Range&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;NP Range&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;Azimuth&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;Elevation&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;X Angle&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;Y Angle&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;DirCos East&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;DirCos North&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;Right Ascension&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;Declination&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;SB Right Ascension&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;SB Declination&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;SB Range&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;SB Azimuth&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;SB Elevation&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;L1 Phase&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;L2 Phase&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;CA Pseudo-range&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;P1 Pseudo-range&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;P2 Pseudo-range&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;LA Phase&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;CA SD Pseudo-range&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;DF Pseudo-range&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;DF SD Pseudo-range&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;L1 SD Phase&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;L2 SD Phase&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;LA SD Phase&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;DF Phase&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;DF SD Phase&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;2L CA Pseudo-range&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;CA DD Pseudo-range&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;DF DD Pseudo-range&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;L1 DD Phase&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;DF DD Phase&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;CA Nav Sol&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;DF Nav Sol&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;4L Range&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;5L Doppler&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;BRTS Range&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;BRTS Doppler&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;3L Doppler&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;TDOA&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;SD TDOA&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;TDOA Dot&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;FDOA&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;SD FDOA&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;SB TDOA&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;SB TDOA Dot&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;SB FDOA&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;GroundTDOA&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;GroundFDOA&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;Eph Pos&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;Eph Vel&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;DSN Doppler&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;DSN 3W Doppler&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;DSN TCP&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;DSN 3W TCP&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Measurement Type">
                                                                            <STRING>&quot;DSN Seq Rng&quot;</STRING>
                                                                        </VAR>
                                                                    </LIST>
                                                                </VAR>
                                                                <VAR name = "CalcNumMeasurements">
                                                                    <BOOL>true</BOOL>
                                                                </VAR>
                                                                <VAR name = "Stages">
                                                                    <LIST>
                                                                        <SCOPE Class = "LSControls">
                                                                            <VAR name = "StartTime">
                                                                                <DATE>29 Jan 1995 02:39:06.000</DATE>
                                                                            </VAR>
                                                                            <VAR name = "StopTime">
                                                                                <DATE>29 Jan 1995 06:39:06.000</DATE>
                                                                            </VAR>
                                                                            <VAR name = "DataFrequency">
                                                                                <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                                    <REAL>0</REAL>
                                                                                </QUANTITY>
                                                                            </VAR>
                                                                            <VAR name = "EstimateBCoeff">
                                                                                <BOOL>false</BOOL>
                                                                            </VAR>
                                                                            <VAR name = "EstimateCr">
                                                                                <BOOL>false</BOOL>
                                                                            </VAR>
                                                                            <VAR name = "EstimateTransBias">
                                                                                <BOOL>false</BOOL>
                                                                            </VAR>
                                                                            <VAR name = "EstimateMeasBias">
                                                                                <BOOL>false</BOOL>
                                                                            </VAR>
                                                                            <VAR name = "MaxIterations">
                                                                                <INT>10</INT>
                                                                            </VAR>
                                                                            <VAR name = "RMSConvergenceCriteria">
                                                                                <REAL>0.001</REAL>
                                                                            </VAR>
                                                                            <VAR name = "SigmaEdit">
                                                                                <BOOL>true</BOOL>
                                                                            </VAR>
                                                                            <VAR name = "Sigma">
                                                                                <REAL>3</REAL>
                                                                            </VAR>
                                                                            <VAR name = "InitialEdit">
                                                                                <BOOL>false</BOOL>
                                                                            </VAR>
                                                                            <VAR name = "StateCorrection">
                                                                                <STRING>&quot;Pos and Vel&quot;</STRING>
                                                                            </VAR>
                                                                        </SCOPE>
                                                                    </LIST>
                                                                </VAR>
                                                                <VAR name = "ProcessControl">
                                                                    <SCOPE Class = "ProcessControl">
                                                                        <VAR name = "StartMode">
                                                                            <STRING>&quot;Initial&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "SelectedRestartTime">
                                                                            <STRING>&quot;29 Jan 1995 02:38:37.000 UTCG&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "AutoSelectedRestartTime">
                                                                            <STRING>&quot;29 Jan 1995 02:38:37.000 UTCG&quot;</STRING>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "StartFromLastSolution">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                                <VAR name = "IsLastLSSolutionAvailable">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                                <VAR name = "FinalSigmaEditIteration">
                                                                    <INT>100</INT>
                                                                </VAR>
                                                                <VAR name = "Restart">
                                                                    <SCOPE>
                                                                        <VAR name = "SaveRecordsToFile">
                                                                            <BOOL>true</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "MaxRecordsInFile">
                                                                            <INT>100</INT>
                                                                        </VAR>
                                                                        <VAR name = "BackupRestartRecords">
                                                                            <BOOL>true</BOOL>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "CustomDataEditing">
                                                                    <SCOPE Class = "CustomDataEditing">
                                                                        <VAR name = "Enabled">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "OverrideValidity">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "Schedule">
                                                                            <LIST />
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "ResidualEditing">
                                                                    <SCOPE Class = "ResidualEditing">
                                                                        <VAR name = "Enabled">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "Schedule">
                                                                            <LIST />
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "OrbitStateUpdateRepresentation">
                                                                    <STRING>&quot;Cartesian&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "SolveForMethod">
                                                                    <STRING>&quot;QR&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "CombineMeasUncertainty">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                                <VAR name = "LineSearch">
                                                                    <SCOPE>
                                                                        <VAR name = "Method">
                                                                            <STRING>&quot;None&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Fraction">
                                                                            <REAL>0.5</REAL>
                                                                        </VAR>
                                                                        <VAR name = "DampingControl">
                                                                            <STRING>&quot;GainRatio&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "DampingFactor">
                                                                            <REAL>0.001</REAL>
                                                                        </VAR>
                                                                        <VAR name = "AcceptDampingFactor">
                                                                            <REAL>3</REAL>
                                                                        </VAR>
                                                                        <VAR name = "RejectDampingFactor">
                                                                            <REAL>5</REAL>
                                                                        </VAR>
                                                                        <VAR name = "MaxOrbitChange">
                                                                            <REAL>0.001</REAL>
                                                                        </VAR>
                                                                        <VAR name = "MaxTrys">
                                                                            <INT>10</INT>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "EpochControl">
                                                                    <SCOPE Class = "EpochControl">
                                                                        <VAR name = "EpochLocation">
                                                                            <STRING>&quot;Beginning&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "SolutionEpoch">
                                                                            <DATE>29 Jan 1995 02:39:06.000</DATE>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "UseAprioriCovariance">
                                                                    <SCOPE Class = "AprioriCovariance">
                                                                        <VAR name = "PositionVelocity">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "Drag">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "SRP">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "TransBias">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "MeasBias">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "ConsiderStates">
                                                                    <SCOPE Class = "ConsiderCov">
                                                                        <VAR name = "Drag">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "SolarPressure">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "TransBias">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "MeasBias">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "CheckForDivergence">
                                                                    <BOOL>true</BOOL>
                                                                </VAR>
                                                                <VAR name = "NumDivergingIterations">
                                                                    <INT>2</INT>
                                                                </VAR>
                                                                <VAR name = "CheckConditionNumber">
                                                                    <BOOL>true</BOOL>
                                                                </VAR>
                                                                <VAR name = "MaxIterationsStatus">
                                                                    <STRING>&quot;Failure&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "AbsoluteRMSChecks">
                                                                    <SCOPE Class = "AbsoluteRMSChecks">
                                                                        <VAR name = "Enabled">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "AcceptableRMS">
                                                                            <REAL>10</REAL>
                                                                        </VAR>
                                                                        <VAR name = "ConvergedRMS">
                                                                            <REAL>0.001</REAL>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "MotionModel">
                                                                    <STRING>&quot;Orbiter&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "Output">
                                                                    <SCOPE Class = "Output">
                                                                        <VAR name = "Filename">
                                                                            <STRING>&quot;C:\Users\dvallado\Documents\ODTK 7\DataArchive\Sat7734.lsrun&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "ResidualArchiving">
                                                                            <STRING>&quot;All Iterations&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "OutputStateHistory">
                                                                            <STRING>&quot;Last Iteration&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "SuccessfulRun">
                                                                            <BOOL>true</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "OrbitState">
                                                                            <PROP name = "DisplayCoordFlag">
                                                                                <STRING>&quot;Keplerian&quot;</STRING>
                                                                            </PROP>
                                                                            <SCOPE Class = "Cartesian">
                                                                                <VAR name = "CentralBody">
                                                                                    <STRING>&quot;Earth&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "CoordFrame">
                                                                                    <STRING>&quot;J2000&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "Epoch">
                                                                                    <DATE>29 Jan 1995 02:39:06.000</DATE>
                                                                                </VAR>
                                                                                <VAR name = "XPosition">
                                                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                                                                        <REAL>5748.39777387301</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "YPosition">
                                                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                                                                        <REAL>2680.134998597202</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "ZPosition">
                                                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                                                                        <REAL>3442.298174501561</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "XVelocity">
                                                                                    <QUANTITY Dimension = "Rate" Unit = "km*sec^-1">
                                                                                        <REAL>4.327444644699857</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "YVelocity">
                                                                                    <QUANTITY Dimension = "Rate" Unit = "km*sec^-1">
                                                                                        <REAL>-1.920138953450707</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "ZVelocity">
                                                                                    <QUANTITY Dimension = "Rate" Unit = "km*sec^-1">
                                                                                        <REAL>-5.726072213188015</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                            </SCOPE>
                                                                        </VAR>
                                                                        <VAR name = "OrbitUncertainty">
                                                                            <SCOPE>
                                                                                <VAR name = "R_sigma">
                                                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                        <REAL>0</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "I_sigma">
                                                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                        <REAL>0</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "C_sigma">
                                                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                        <REAL>0</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "Rdot_sigma">
                                                                                    <QUANTITY Dimension = "Rate" Unit = "m*sec^-1">
                                                                                        <REAL>0</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "Idot_sigma">
                                                                                    <QUANTITY Dimension = "Rate" Unit = "m*sec^-1">
                                                                                        <REAL>0</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "Cdot_sigma">
                                                                                    <QUANTITY Dimension = "Rate" Unit = "m*sec^-1">
                                                                                        <REAL>0</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "RI_correlation">
                                                                                    <REAL>0</REAL>
                                                                                </VAR>
                                                                                <VAR name = "RC_correlation">
                                                                                    <REAL>0</REAL>
                                                                                </VAR>
                                                                                <VAR name = "RRdot_correlation">
                                                                                    <REAL>0</REAL>
                                                                                </VAR>
                                                                                <VAR name = "RIdot_correlation">
                                                                                    <REAL>0</REAL>
                                                                                </VAR>
                                                                                <VAR name = "RCdot_correlation">
                                                                                    <REAL>0</REAL>
                                                                                </VAR>
                                                                                <VAR name = "IC_correlation">
                                                                                    <REAL>0</REAL>
                                                                                </VAR>
                                                                                <VAR name = "IRdot_correlation">
                                                                                    <REAL>0</REAL>
                                                                                </VAR>
                                                                                <VAR name = "IIdot_correlation">
                                                                                    <REAL>0</REAL>
                                                                                </VAR>
                                                                                <VAR name = "ICdot_correlation">
                                                                                    <REAL>0</REAL>
                                                                                </VAR>
                                                                                <VAR name = "CRdot_correlation">
                                                                                    <REAL>0</REAL>
                                                                                </VAR>
                                                                                <VAR name = "CIdot_correlation">
                                                                                    <REAL>0</REAL>
                                                                                </VAR>
                                                                                <VAR name = "CCdot_correlation">
                                                                                    <REAL>0</REAL>
                                                                                </VAR>
                                                                                <VAR name = "RdotIdot_correlation">
                                                                                    <REAL>0</REAL>
                                                                                </VAR>
                                                                                <VAR name = "RdotCdot_correlation">
                                                                                    <REAL>0</REAL>
                                                                                </VAR>
                                                                                <VAR name = "IdotCdot_correlation">
                                                                                    <REAL>0</REAL>
                                                                                </VAR>
                                                                            </SCOPE>
                                                                        </VAR>
                                                                        <VAR name = "LocationUncertainty">
                                                                            <SCOPE>
                                                                                <VAR name = "SouthSigma">
                                                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                        <REAL>0</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "EastSigma">
                                                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                        <REAL>0</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "AltitudeSigma">
                                                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                        <REAL>0</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "SouthEastCorrelation">
                                                                                    <REAL>0</REAL>
                                                                                </VAR>
                                                                                <VAR name = "SouthAltCorrelation">
                                                                                    <REAL>0</REAL>
                                                                                </VAR>
                                                                                <VAR name = "EastAltCorrelation">
                                                                                    <REAL>0</REAL>
                                                                                </VAR>
                                                                            </SCOPE>
                                                                        </VAR>
                                                                        <VAR name = "BallisticCoeffNominal">
                                                                            <REAL>0.0070967741935484</REAL>
                                                                        </VAR>
                                                                        <VAR name = "CPNominal">
                                                                            <REAL>1</REAL>
                                                                        </VAR>
                                                                        <VAR name = "ForceModelList">
                                                                            <LIST>
                                                                                <VAR name = "ForceModelList">
                                                                                    <SCOPE>
                                                                                        <VAR name = "Type">
                                                                                            <STRING>&quot;BallisticCoefficient&quot;</STRING>
                                                                                        </VAR>
                                                                                        <VAR name = "Name">
                                                                                            <STRING>&quot;B&quot;</STRING>
                                                                                        </VAR>
                                                                                        <VAR name = "Estimated">
                                                                                            <BOOL>false</BOOL>
                                                                                        </VAR>
                                                                                        <VAR name = "Nominal">
                                                                                            <REAL>0.0070967741935484</REAL>
                                                                                        </VAR>
                                                                                        <VAR name = "LSCorrection">
                                                                                            <REAL>0</REAL>
                                                                                        </VAR>
                                                                                        <VAR name = "Total">
                                                                                            <REAL>0.0070967741935484</REAL>
                                                                                        </VAR>
                                                                                        <VAR name = "Sigma">
                                                                                            <REAL>0</REAL>
                                                                                        </VAR>
                                                                                    </SCOPE>
                                                                                </VAR>
                                                                                <VAR name = "ForceModelList">
                                                                                    <SCOPE>
                                                                                        <VAR name = "Type">
                                                                                            <STRING>&quot;SolarPressure&quot;</STRING>
                                                                                        </VAR>
                                                                                        <VAR name = "Name">
                                                                                            <STRING>&quot;Cp&quot;</STRING>
                                                                                        </VAR>
                                                                                        <VAR name = "Estimated">
                                                                                            <BOOL>false</BOOL>
                                                                                        </VAR>
                                                                                        <VAR name = "Nominal">
                                                                                            <REAL>1</REAL>
                                                                                        </VAR>
                                                                                        <VAR name = "LSCorrection">
                                                                                            <REAL>0</REAL>
                                                                                        </VAR>
                                                                                        <VAR name = "Total">
                                                                                            <REAL>1</REAL>
                                                                                        </VAR>
                                                                                        <VAR name = "Sigma">
                                                                                            <REAL>0</REAL>
                                                                                        </VAR>
                                                                                    </SCOPE>
                                                                                </VAR>
                                                                            </LIST>
                                                                        </VAR>
                                                                        <VAR name = "TransBiasList">
                                                                            <LIST />
                                                                        </VAR>
                                                                        <VAR name = "MeasBiasList">
                                                                            <LIST />
                                                                        </VAR>
                                                                        <VAR name = "StatesToTransfer">
                                                                            <SCOPE Class = "StatesToTransfer">
                                                                                <VAR name = "PositionVelocity">
                                                                                    <BOOL>true</BOOL>
                                                                                </VAR>
                                                                                <VAR name = "Drag">
                                                                                    <BOOL>true</BOOL>
                                                                                </VAR>
                                                                                <VAR name = "SolarPressure">
                                                                                    <BOOL>true</BOOL>
                                                                                </VAR>
                                                                                <VAR name = "PosVelCovariance">
                                                                                    <BOOL>false</BOOL>
                                                                                </VAR>
                                                                                <VAR name = "PosCovSigmaScaling">
                                                                                    <REAL>1</REAL>
                                                                                </VAR>
                                                                                <VAR name = "VelCovSigmaScaling">
                                                                                    <REAL>1</REAL>
                                                                                </VAR>
                                                                                <VAR name = "EpochLocation">
                                                                                    <STRING>&quot;Solution Epoch&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "SolutionEpoch">
                                                                                    <DATE>29 Jan 1995 02:39:06.000</DATE>
                                                                                </VAR>
                                                                            </SCOPE>
                                                                        </VAR>
                                                                        <VAR name = "STKEphemeris">
                                                                            <SCOPE>
                                                                                <VAR name = "DuringProcess">
                                                                                    <SCOPE>
                                                                                        <VAR name = "Generate">
                                                                                            <BOOL>false</BOOL>
                                                                                        </VAR>
                                                                                        <VAR name = "TimeGrid">
                                                                                            <STRING>&quot;Uniform&quot;</STRING>
                                                                                        </VAR>
                                                                                        <VAR name = "MaxTimeStep">
                                                                                            <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                                                <REAL>2</REAL>
                                                                                            </QUANTITY>
                                                                                        </VAR>
                                                                                        <VAR name = "UniformTimeStep">
                                                                                            <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                                                <REAL>2</REAL>
                                                                                            </QUANTITY>
                                                                                        </VAR>
                                                                                    </SCOPE>
                                                                                </VAR>
                                                                                <VAR name = "Predict">
                                                                                    <SCOPE>
                                                                                        <VAR name = "Generate">
                                                                                            <BOOL>false</BOOL>
                                                                                        </VAR>
                                                                                        <VAR name = "TimeStep">
                                                                                            <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                                                <REAL>1</REAL>
                                                                                            </QUANTITY>
                                                                                        </VAR>
                                                                                        <VAR name = "AlignTimeGrid">
                                                                                            <BOOL>true</BOOL>
                                                                                        </VAR>
                                                                                        <VAR name = "StopMode">
                                                                                            <STRING>&quot;TimeSpan&quot;</STRING>
                                                                                        </VAR>
                                                                                        <VAR name = "TimeSpan">
                                                                                            <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                                                <REAL>720</REAL>
                                                                                            </QUANTITY>
                                                                                        </VAR>
                                                                                        <VAR name = "StopTime">
                                                                                            <DATE>29 Jan 1995 14:39:06.000</DATE>
                                                                                        </VAR>
                                                                                    </SCOPE>
                                                                                </VAR>
                                                                                <VAR name = "EphemerisArchiving">
                                                                                    <STRING>&quot;Final Iteration&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "CoordFrame">
                                                                                    <LIST>
                                                                                        <VAR name = "SatCoordFrameList">
                                                                                            <SCOPE>
                                                                                                <VAR name = "Satellite">
                                                                                                    <LINKTOOBJ>
                                                                                                        <STRING>&quot;Sat7734&quot;</STRING>
                                                                                                    </LINKTOOBJ>
                                                                                                </VAR>
                                                                                                <VAR name = "CBName">
                                                                                                    <STRING>&quot;Earth&quot;</STRING>
                                                                                                </VAR>
                                                                                                <VAR name = "CoordFrame">
                                                                                                    <STRING>&quot;J2000&quot;</STRING>
                                                                                                </VAR>
                                                                                            </SCOPE>
                                                                                        </VAR>
                                                                                    </LIST>
                                                                                </VAR>
                                                                                <VAR name = "Acceleration">
                                                                                    <BOOL>false</BOOL>
                                                                                </VAR>
                                                                                <VAR name = "Covariance">
                                                                                    <BOOL>false</BOOL>
                                                                                </VAR>
                                                                                <VAR name = "CovarianceType">
                                                                                    <STRING>&quot;Position 3x3 Covariance&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "CovarianceCoordFrame">
                                                                                    <STRING>&quot;SameAsEphemeris&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "StateErrorTransition">
                                                                                    <BOOL>false</BOOL>
                                                                                </VAR>
                                                                                <VAR name = "FileFormat">
                                                                                    <STRING>&quot;STK Ephemeris&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "OutputDirectory">
                                                                                    <STRING>&quot;C:\Users\dvallado\Documents\ODTK 7\Ephemeris&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "FileNamingOption">
                                                                                    <STRING>&quot;ProcessStart&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "Files">
                                                                                    <LIST />
                                                                                </VAR>
                                                                            </SCOPE>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "Children">
                                                                    <SCOPE />
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "InitialOrbitDetermination">
                                                    <SCOPE>
                                                        <VAR name = "IOD1">
                                                            <SCOPE Class = "InitialOrbitDetermination">
                                                                <PROP name = "version">
                                                                    <STRING>&quot;7.7&quot;</STRING>
                                                                </PROP>
                                                                <VAR name = "Description">
                                                                    <STRING>&quot;&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "Method">
                                                                    <PROP name = "Type">
                                                                        <STRING>&quot;HerrickGibbs&quot;</STRING>
                                                                    </PROP>
                                                                    <SCOPE>
                                                                        <VAR name = "SelectedFacility">
                                                                            <LINKTOOBJ>
                                                                                <STRING>&quot;SSNTrackingSystem.KPTQ&quot;</STRING>
                                                                            </LINKTOOBJ>
                                                                        </VAR>
                                                                        <VAR name = "MeasurementPass">
                                                                            <INT>1</INT>
                                                                        </VAR>
                                                                        <VAR name = "MeasurementSampleSize">
                                                                            <INT>10</INT>
                                                                        </VAR>
                                                                        <VAR name = "MinimumElevation">
                                                                            <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                <REAL>5</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "SelectedMeasurements">
                                                                            <LIST>
                                                                                <VAR name = "Measurements">
                                                                                    <STRING>&quot;0073  29 Jan 1995 02:39:50.000     1694.891   23.389&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "Measurements">
                                                                                    <STRING>&quot;0086  29 Jan 1995 02:40:03.000     1641.201   24.748&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "Measurements">
                                                                                    <STRING>&quot;0110  29 Jan 1995 02:40:27.000     1551.640   27.190&quot;</STRING>
                                                                                </VAR>
                                                                            </LIST>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "Solutions">
                                                                    <SCOPE>
                                                                        <VAR name = "NumberOfSolutions">
                                                                            <INT>1</INT>
                                                                        </VAR>
                                                                        <VAR name = "UseSolution">
                                                                            <INT>1</INT>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "Output">
                                                                    <SCOPE Class = "Output">
                                                                        <VAR name = "OrbitState">
                                                                            <PROP name = "DisplayCoordFlag">
                                                                                <STRING>&quot;Keplerian&quot;</STRING>
                                                                            </PROP>
                                                                            <SCOPE Class = "Cartesian">
                                                                                <VAR name = "CentralBody">
                                                                                    <STRING>&quot;Earth&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "CoordFrame">
                                                                                    <STRING>&quot;J2000&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "Epoch">
                                                                                    <DATE>29 Jan 1995 02:40:32.000</DATE>
                                                                                </VAR>
                                                                                <VAR name = "XPosition">
                                                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                                                                        <REAL>6098.137287338994</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "YPosition">
                                                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                                                                        <REAL>2504.510970406946</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "ZPosition">
                                                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                                                                        <REAL>2937.515594180142</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "XVelocity">
                                                                                    <QUANTITY Dimension = "Rate" Unit = "km*sec^-1">
                                                                                        <REAL>3.790025227317104</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "YVelocity">
                                                                                    <QUANTITY Dimension = "Rate" Unit = "km*sec^-1">
                                                                                        <REAL>-2.158162482414496</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "ZVelocity">
                                                                                    <QUANTITY Dimension = "Rate" Unit = "km*sec^-1">
                                                                                        <REAL>-6.015147476525751</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                            </SCOPE>
                                                                        </VAR>
                                                                        <VAR name = "ClockPhaseError">
                                                                            <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                                <REAL>0</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "MinNumberOfAvailableSatellites">
                                                                            <INT>0</INT>
                                                                        </VAR>
                                                                        <VAR name = "MaxNumberOfAvailableSatellites">
                                                                            <INT>0</INT>
                                                                        </VAR>
                                                                        <VAR name = "MinGeometricDilutionOfPrecision">
                                                                            <REAL>0</REAL>
                                                                        </VAR>
                                                                        <VAR name = "MaxGeometricDilutionOfPrecision">
                                                                            <REAL>0</REAL>
                                                                        </VAR>
                                                                        <VAR name = "DataArchive">
                                                                            <SCOPE Class = "DataArchive">
                                                                                <VAR name = "Filename">
                                                                                    <STRING>&quot;C:\Users\dvallado\Documents\ODTK 7\DataArchive\Example10-4_Sat7734_IOD1.iodrun&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "OutputStateHistory">
                                                                                    <STRING>&quot;true&quot;</STRING>
                                                                                </VAR>
                                                                            </SCOPE>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "Children">
                                                                    <SCOPE />
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                    </SCOPE>
                                </VAR>
                            </SCOPE>
                        </VAR>
                        <VAR name = "TrackingSystem">
                            <SCOPE>
                                <VAR name = "SSNTrackingSystem">
                                    <SCOPE Class = "TrackingSystem">
                                        <PROP name = "version">
                                            <STRING>&quot;7.7&quot;</STRING>
                                        </PROP>
                                        <VAR name = "Description">
                                            <STRING>&quot;&quot;</STRING>
                                        </VAR>
                                        <VAR name = "TroposphereModel">
                                            <SCOPE Class = "TroposphereModel">
                                                <VAR name = "Enabled">
                                                    <BOOL>true</BOOL>
                                                </VAR>
                                                <VAR name = "Model">
                                                    <STRING>&quot;SCF&quot;</STRING>
                                                </VAR>
                                                <VAR name = "MappingFunction">
                                                    <STRING>&quot;MP Surface Temperature&quot;</STRING>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "IonosphereModel">
                                            <SCOPE Class = "IonosphereModel">
                                                <VAR name = "Enabled">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                                <VAR name = "Model">
                                                    <STRING>&quot;IRI2016&quot;</STRING>
                                                </VAR>
                                                <VAR name = "TransmitFreq">
                                                    <QUANTITY Dimension = "FrequencyUnit" Unit = "MHz">
                                                        <REAL>2267.5</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "ReceiveFreq">
                                                    <QUANTITY Dimension = "FrequencyUnit" Unit = "MHz">
                                                        <REAL>1815.7715</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "Children">
                                            <SCOPE>
                                                <VAR name = "Facility">
                                                    <SCOPE>
                                                        <VAR name = "KPTQ">
                                                            <SCOPE Class = "Facility">
                                                                <PROP name = "version">
                                                                    <STRING>&quot;7.7&quot;</STRING>
                                                                </PROP>
                                                                <VAR name = "Description">
                                                                    <STRING>&quot;&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "CentralBody">
                                                                    <STRING>&quot;Earth&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "Position">
                                                                    <PROP name = "DisplayCoordFlag">
                                                                        <STRING>&quot;Geodetic&quot;</STRING>
                                                                    </PROP>
                                                                    <SCOPE Class = "Geodetic">
                                                                        <VAR name = "Lat">
                                                                            <QUANTITY Dimension = "LatitudeUnit" Unit = "rad">
                                                                                <REAL>0.3765034036245979</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "Lon">
                                                                            <QUANTITY Dimension = "LongitudeUnit" Unit = "rad">
                                                                                <REAL>-2.762272881964422</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "Alt">
                                                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                <REAL>300.2</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "PositionType">
                                                                    <STRING>&quot;MeanTide&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "ModelStationMotion">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                                <VAR name = "MotionModel">
                                                                    <SCOPE>
                                                                        <VAR name = "PlateMotion">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "Epoch">
                                                                            <DATE>1 Jan 1997 00:00:30.000</DATE>
                                                                        </VAR>
                                                                        <VAR name = "Velocity">
                                                                            <SCOPE>
                                                                                <VAR name = "X">
                                                                                    <QUANTITY Dimension = "SlowRate" Unit = "cm*yr^-1">
                                                                                        <REAL>0</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "Y">
                                                                                    <QUANTITY Dimension = "SlowRate" Unit = "cm*yr^-1">
                                                                                        <REAL>0</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "Z">
                                                                                    <QUANTITY Dimension = "SlowRate" Unit = "cm*yr^-1">
                                                                                        <REAL>0</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                            </SCOPE>
                                                                        </VAR>
                                                                        <VAR name = "OceanTideLoading">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "OceanTideLoadingFile">
                                                                            <STRING>&quot;&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "SolidEarthTides">
                                                                            <BOOL>true</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "PoleTide">
                                                                            <BOOL>true</BOOL>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "Estimate">
                                                                    <STRING>&quot;Nothing&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "LocationErrors">
                                                                    <SCOPE>
                                                                        <VAR name = "SouthSigma">
                                                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                <REAL>30</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "EastSigma">
                                                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                <REAL>30</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "AltitudeSigma">
                                                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                <REAL>30</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "SouthEastCorrelation">
                                                                            <REAL>0</REAL>
                                                                        </VAR>
                                                                        <VAR name = "SouthAltCorrelation">
                                                                            <REAL>0</REAL>
                                                                        </VAR>
                                                                        <VAR name = "EastAltCorrelation">
                                                                            <REAL>0</REAL>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "UsePositionFromMeasurementFile">
                                                                    <BOOL>true</BOOL>
                                                                </VAR>
                                                                <VAR name = "MeasurementStatistics">
                                                                    <LIST>
                                                                        <VAR name = "Range">
                                                                            <SCOPE>
                                                                                <VAR name = "Type">
                                                                                    <PROP name = "Type">
                                                                                        <STRING>&quot;Range&quot;</STRING>
                                                                                    </PROP>
                                                                                    <SCOPE>
                                                                                        <VAR name = "BiasModel">
                                                                                            <PROP name = "Type">
                                                                                                <STRING>&quot;GaussMarkov&quot;</STRING>
                                                                                            </PROP>
                                                                                            <SCOPE>
                                                                                                <VAR name = "isModeledTwoWay">
                                                                                                    <BOOL>true</BOOL>
                                                                                                </VAR>
                                                                                                <VAR name = "NominalStored">
                                                                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                                        <REAL>160</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "Constant">
                                                                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                                        <REAL>80</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "InitialEstimate">
                                                                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                                        <REAL>0</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "SigmaStored">
                                                                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                                        <REAL>100</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "Sigma">
                                                                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                                        <REAL>50</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "HalfLife">
                                                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                                                        <REAL>5</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                            </SCOPE>
                                                                                        </VAR>
                                                                                        <VAR name = "WhiteNoiseSigmaTwoWay">
                                                                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                                <REAL>185</REAL>
                                                                                            </QUANTITY>
                                                                                        </VAR>
                                                                                        <VAR name = "EstimateBias">
                                                                                            <BOOL>true</BOOL>
                                                                                        </VAR>
                                                                                        <VAR name = "TropoSigma">
                                                                                            <REAL>0.05</REAL>
                                                                                        </VAR>
                                                                                        <VAR name = "LightTimeDelay">
                                                                                            <BOOL>true</BOOL>
                                                                                        </VAR>
                                                                                        <VAR name = "ModelInSolarSystemBarycenterFrame">
                                                                                            <BOOL>false</BOOL>
                                                                                        </VAR>
                                                                                        <VAR name = "BoresightBiasModel">
                                                                                            <BOOL>false</BOOL>
                                                                                        </VAR>
                                                                                    </SCOPE>
                                                                                </VAR>
                                                                            </SCOPE>
                                                                        </VAR>
                                                                        <VAR name = "Azimuth">
                                                                            <SCOPE>
                                                                                <VAR name = "Type">
                                                                                    <PROP name = "Type">
                                                                                        <STRING>&quot;Azimuth&quot;</STRING>
                                                                                    </PROP>
                                                                                    <SCOPE>
                                                                                        <VAR name = "BiasModel">
                                                                                            <PROP name = "Type">
                                                                                                <STRING>&quot;GaussMarkov&quot;</STRING>
                                                                                            </PROP>
                                                                                            <SCOPE>
                                                                                                <VAR name = "isModeledTwoWay">
                                                                                                    <BOOL>false</BOOL>
                                                                                                </VAR>
                                                                                                <VAR name = "NominalStored">
                                                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                                        <REAL>0.0081</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "Constant">
                                                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                                        <REAL>0.0081</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "InitialEstimate">
                                                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                                        <REAL>0</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "SigmaStored">
                                                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                                        <REAL>0.3</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "Sigma">
                                                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                                        <REAL>0.3</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "HalfLife">
                                                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                                                        <REAL>60</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                            </SCOPE>
                                                                                        </VAR>
                                                                                        <VAR name = "WhiteNoiseSigma">
                                                                                            <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                                <REAL>0.0224</REAL>
                                                                                            </QUANTITY>
                                                                                        </VAR>
                                                                                        <VAR name = "EstimateBias">
                                                                                            <BOOL>true</BOOL>
                                                                                        </VAR>
                                                                                        <VAR name = "LightTimeDelay">
                                                                                            <BOOL>false</BOOL>
                                                                                        </VAR>
                                                                                    </SCOPE>
                                                                                </VAR>
                                                                            </SCOPE>
                                                                        </VAR>
                                                                        <VAR name = "Elevation">
                                                                            <SCOPE>
                                                                                <VAR name = "Type">
                                                                                    <PROP name = "Type">
                                                                                        <STRING>&quot;Elevation&quot;</STRING>
                                                                                    </PROP>
                                                                                    <SCOPE>
                                                                                        <VAR name = "BiasModel">
                                                                                            <PROP name = "Type">
                                                                                                <STRING>&quot;GaussMarkov&quot;</STRING>
                                                                                            </PROP>
                                                                                            <SCOPE>
                                                                                                <VAR name = "isModeledTwoWay">
                                                                                                    <BOOL>false</BOOL>
                                                                                                </VAR>
                                                                                                <VAR name = "NominalStored">
                                                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                                        <REAL>0.0045</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "Constant">
                                                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                                        <REAL>0.0045</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "InitialEstimate">
                                                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                                        <REAL>0</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "SigmaStored">
                                                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                                        <REAL>0.03</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "Sigma">
                                                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                                        <REAL>0.03</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "HalfLife">
                                                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                                                        <REAL>60</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                            </SCOPE>
                                                                                        </VAR>
                                                                                        <VAR name = "WhiteNoiseSigma">
                                                                                            <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                                <REAL>0.0139</REAL>
                                                                                            </QUANTITY>
                                                                                        </VAR>
                                                                                        <VAR name = "EstimateBias">
                                                                                            <BOOL>true</BOOL>
                                                                                        </VAR>
                                                                                        <VAR name = "TropoSigma">
                                                                                            <REAL>0.05</REAL>
                                                                                        </VAR>
                                                                                        <VAR name = "LightTimeDelay">
                                                                                            <BOOL>false</BOOL>
                                                                                        </VAR>
                                                                                    </SCOPE>
                                                                                </VAR>
                                                                            </SCOPE>
                                                                        </VAR>
                                                                    </LIST>
                                                                </VAR>
                                                                <VAR name = "MeasurementProcessing">
                                                                    <SCOPE>
                                                                        <VAR name = "TrackingID">
                                                                            <INT>932</INT>
                                                                        </VAR>
                                                                        <VAR name = "TrackingIDAliases">
                                                                            <PROP name = "NewElem"></PROP>
                                                                            <LIST />
                                                                        </VAR>
                                                                        <VAR name = "AllowMeasProcessing">
                                                                            <BOOL>true</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "MeasTypes">
                                                                            <PROP name = "EmptyDescription">
                                                                                <STRING>&quot;An empty list allows all measurement types to be processed&quot;</STRING>
                                                                            </PROP>
                                                                            <LIST>
                                                                                <VAR name = "Measurement Type">
                                                                                    <STRING>&quot;Range&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "Measurement Type">
                                                                                    <STRING>&quot;Doppler&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "Measurement Type">
                                                                                    <STRING>&quot;1W Bistatic Range&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "Measurement Type">
                                                                                    <STRING>&quot;NP Range&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "Measurement Type">
                                                                                    <STRING>&quot;Azimuth&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "Measurement Type">
                                                                                    <STRING>&quot;Elevation&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "Measurement Type">
                                                                                    <STRING>&quot;X Angle&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "Measurement Type">
                                                                                    <STRING>&quot;Y Angle&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "Measurement Type">
                                                                                    <STRING>&quot;Right Ascension&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "Measurement Type">
                                                                                    <STRING>&quot;Declination&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "Measurement Type">
                                                                                    <STRING>&quot;SB Right Ascension&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "Measurement Type">
                                                                                    <STRING>&quot;SB Declination&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "Measurement Type">
                                                                                    <STRING>&quot;SB Range&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "Measurement Type">
                                                                                    <STRING>&quot;SB Azimuth&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "Measurement Type">
                                                                                    <STRING>&quot;SB Elevation&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "Measurement Type">
                                                                                    <STRING>&quot;L1 Phase&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "Measurement Type">
                                                                                    <STRING>&quot;L2 Phase&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "Measurement Type">
                                                                                    <STRING>&quot;CA Pseudo-range&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "Measurement Type">
                                                                                    <STRING>&quot;P1 Pseudo-range&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "Measurement Type">
                                                                                    <STRING>&quot;P2 Pseudo-range&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "Measurement Type">
                                                                                    <STRING>&quot;LA Phase&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "Measurement Type">
                                                                                    <STRING>&quot;CA SD Pseudo-range&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "Measurement Type">
                                                                                    <STRING>&quot;DF Pseudo-range&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "Measurement Type">
                                                                                    <STRING>&quot;DF SD Pseudo-range&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "Measurement Type">
                                                                                    <STRING>&quot;L1 SD Phase&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "Measurement Type">
                                                                                    <STRING>&quot;L2 SD Phase&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "Measurement Type">
                                                                                    <STRING>&quot;LA SD Phase&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "Measurement Type">
                                                                                    <STRING>&quot;DF Phase&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "Measurement Type">
                                                                                    <STRING>&quot;DF SD Phase&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "Measurement Type">
                                                                                    <STRING>&quot;2L CA Pseudo-range&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "Measurement Type">
                                                                                    <STRING>&quot;CA DD Pseudo-range&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "Measurement Type">
                                                                                    <STRING>&quot;DF DD Pseudo-range&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "Measurement Type">
                                                                                    <STRING>&quot;L1 DD Phase&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "Measurement Type">
                                                                                    <STRING>&quot;DF DD Phase&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "Measurement Type">
                                                                                    <STRING>&quot;CA Nav Sol&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "Measurement Type">
                                                                                    <STRING>&quot;DF Nav Sol&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "Measurement Type">
                                                                                    <STRING>&quot;4L Range&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "Measurement Type">
                                                                                    <STRING>&quot;5L Doppler&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "Measurement Type">
                                                                                    <STRING>&quot;BRTS Range&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "Measurement Type">
                                                                                    <STRING>&quot;BRTS Doppler&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "Measurement Type">
                                                                                    <STRING>&quot;3L Doppler&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "Measurement Type">
                                                                                    <STRING>&quot;TDOA&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "Measurement Type">
                                                                                    <STRING>&quot;SD TDOA&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "Measurement Type">
                                                                                    <STRING>&quot;TDOA Dot&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "Measurement Type">
                                                                                    <STRING>&quot;FDOA&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "Measurement Type">
                                                                                    <STRING>&quot;SD FDOA&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "Measurement Type">
                                                                                    <STRING>&quot;SB TDOA&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "Measurement Type">
                                                                                    <STRING>&quot;SB TDOA Dot&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "Measurement Type">
                                                                                    <STRING>&quot;SB FDOA&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "Measurement Type">
                                                                                    <STRING>&quot;GroundTDOA&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "Measurement Type">
                                                                                    <STRING>&quot;GroundFDOA&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "Measurement Type">
                                                                                    <STRING>&quot;DSN Doppler&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "Measurement Type">
                                                                                    <STRING>&quot;DSN 3W Doppler&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "Measurement Type">
                                                                                    <STRING>&quot;DSN TCP&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "Measurement Type">
                                                                                    <STRING>&quot;DSN 3W TCP&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "Measurement Type">
                                                                                    <STRING>&quot;DSN Seq Rng&quot;</STRING>
                                                                                </VAR>
                                                                            </LIST>
                                                                        </VAR>
                                                                        <VAR name = "MinPassDelta">
                                                                            <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                                <REAL>20</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "GeometricMeasurementDependencies">
                                                                    <SCOPE Class = "GeometricMeasurementDependencies">
                                                                        <VAR name = "Enabled">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "Filename">
                                                                            <STRING>&quot;&quot;</STRING>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "MinElevation">
                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                        <REAL>-90</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "MaxElevation">
                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                        <REAL>90</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "AzElMask">
                                                                    <SCOPE Class = "AzElMask">
                                                                        <VAR name = "Enabled">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "Filename">
                                                                            <STRING>&quot;&quot;</STRING>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "RangingMethod">
                                                                    <STRING>&quot;Skin Track&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "AntennaType">
                                                                    <STRING>&quot;Mechanical&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "AntennaCorrectionType">
                                                                    <STRING>&quot;None&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "AntennaMountType">
                                                                    <STRING>&quot;AzEl&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "DirectionCosineAzimuthOffset">
                                                                    <QUANTITY Dimension = "LongitudeUnit" Unit = "deg">
                                                                        <REAL>0</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "BoresightAzimuth">
                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                        <REAL>0</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "BoresightElevation">
                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                        <REAL>0</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "MaxAngleDown">
                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                        <REAL>59.99999999999999</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "OpticalProperties">
                                                                    <SCOPE Class = "OpticalProperties">
                                                                        <VAR name = "TargetMustBeLit">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "PolarExclusion">
                                                                            <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                <REAL>1</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "MaxSunElevation">
                                                                            <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                <REAL>90</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "MinSunExclusion">
                                                                            <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                <REAL>0</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "MinMoonExclusion">
                                                                            <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                <REAL>0</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "MinEarthExclusion">
                                                                            <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                <REAL>10</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "MaxSolarPhaseAngle">
                                                                            <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                <REAL>180</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "ReferenceFrame">
                                                                            <STRING>&quot;MEME J2000&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "AberrationCorrections">
                                                                            <STRING>&quot;None&quot;</STRING>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "ReferenceEmitter">
                                                                    <LINKTOOBJ>
                                                                        <STRING>&quot;not specified&quot;</STRING>
                                                                    </LINKTOOBJ>
                                                                </VAR>
                                                                <VAR name = "TroposphereModel">
                                                                    <SCOPE Class = "TroposphereModel">
                                                                        <VAR name = "Enabled">
                                                                            <STRING>&quot;Based on Tracking System&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Model">
                                                                            <STRING>&quot;SCF&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "MappingFunction">
                                                                            <STRING>&quot;MP Surface Temperature&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "EstimateBias">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "BiasSigma">
                                                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                <REAL>1</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "BiasHalfLife">
                                                                            <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                                <REAL>30</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "Data">
                                                                            <SCOPE>
                                                                                <VAR name = "SurfaceRefractivity">
                                                                                    <STRING>&quot;Constant&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "ConstantValue">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial1">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial2">
                                                                                    <REAL>0</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial3">
                                                                                    <REAL>0</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial4">
                                                                                    <REAL>0</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial5">
                                                                                    <REAL>0</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial6">
                                                                                    <REAL>0</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial7">
                                                                                    <REAL>0</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial8">
                                                                                    <REAL>0</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial9">
                                                                                    <REAL>0</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial10">
                                                                                    <REAL>0</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial11">
                                                                                    <REAL>0</REAL>
                                                                                </VAR>
                                                                                <VAR name = "DayOfMonth">
                                                                                    <INT>1</INT>
                                                                                </VAR>
                                                                                <VAR name = "Jan">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Feb">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Mar">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Apr">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "May">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Jun">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Jul">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Aug">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Sep">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Oct">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Nov">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Dec">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "OverrideWavelength">
                                                                                    <BOOL>false</BOOL>
                                                                                </VAR>
                                                                                <VAR name = "Wavelength">
                                                                                    <QUANTITY Dimension = "SmallDistanceUnit" Unit = "nanom">
                                                                                        <REAL>694.3</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "MetDataSource">
                                                                                    <STRING>&quot;Constant&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "Temperature">
                                                                                    <QUANTITY Dimension = "Temperature" Unit = "K">
                                                                                        <REAL>295.1</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "Pressure">
                                                                                    <QUANTITY Dimension = "PressureUnit" Unit = "kPa">
                                                                                        <REAL>101.35</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "Humidity">
                                                                                    <QUANTITY Dimension = "Percent" Unit = "%">
                                                                                        <REAL>55</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "MetFiles">
                                                                                    <LIST />
                                                                                </VAR>
                                                                                <VAR name = "OverrideMetData">
                                                                                    <BOOL>false</BOOL>
                                                                                </VAR>
                                                                            </SCOPE>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "IonosphereModel">
                                                                    <SCOPE Class = "IonosphereModel">
                                                                        <VAR name = "Enabled">
                                                                            <STRING>&quot;Based on Tracking System&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Model">
                                                                            <STRING>&quot;IRI2016&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "TransmitFreq">
                                                                            <QUANTITY Dimension = "FrequencyUnit" Unit = "MHz">
                                                                                <REAL>2267.5</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "ReceiveFreq">
                                                                            <QUANTITY Dimension = "FrequencyUnit" Unit = "MHz">
                                                                                <REAL>1815.7715</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "MeasTimeBias">
                                                                    <SCOPE>
                                                                        <VAR name = "Estimate">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "TimeBiasModel">
                                                                            <PROP name = "Type">
                                                                                <STRING>&quot;RandomWalk&quot;</STRING>
                                                                            </PROP>
                                                                            <SCOPE>
                                                                                <VAR name = "isModeledTwoWay">
                                                                                    <BOOL>false</BOOL>
                                                                                </VAR>
                                                                                <VAR name = "InitialEstimateStored">
                                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                                        <REAL>0</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "Constant">
                                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                                        <REAL>0</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "InitialEstimate">
                                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                                        <REAL>0</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "InitialSigmaStored">
                                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                                        <REAL>0.001</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "InitialSigma">
                                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                                        <REAL>0.001</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "DiffusionCoefficient">
                                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                                        <REAL>9.999999999999999e-12</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                            </SCOPE>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "Children">
                                                                    <SCOPE />
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                    </SCOPE>
                                </VAR>
                            </SCOPE>
                        </VAR>
                        <VAR name = "Filter">
                            <SCOPE>
                                <VAR name = "Filter7734">
                                    <SCOPE Class = "Filter">
                                        <PROP name = "version">
                                            <STRING>&quot;7.7&quot;</STRING>
                                        </PROP>
                                        <VAR name = "Description">
                                            <STRING>&quot;&quot;</STRING>
                                        </VAR>
                                        <VAR name = "SatelliteList">
                                            <PROP name = "EmptyDescription">
                                                <STRING>&quot;An empty list allows all satellites to be used&quot;</STRING>
                                            </PROP>
                                            <SETLINKTOOBJ>
                                                <STRING>&quot;Sat7734&quot;</STRING>
                                            </SETLINKTOOBJ>
                                        </VAR>
                                        <VAR name = "TrackerList">
                                            <PROP name = "EmptyDescription">
                                                <STRING>&quot;An empty list allows all trackers to be used&quot;</STRING>
                                            </PROP>
                                            <SETLINKTOOBJ>
                                                <STRING>&quot;SSNTrackingSystem.KPTQ&quot;</STRING>
                                            </SETLINKTOOBJ>
                                        </VAR>
                                        <VAR name = "EmitterList">
                                            <PROP name = "EmptyDescription">
                                                <STRING>&quot;An empty list allows all emitters to be used&quot;</STRING>
                                            </PROP>
                                            <SETLINKTOOBJ />
                                        </VAR>
                                        <VAR name = "SurfaceVehicleList">
                                            <PROP name = "EmptyDescription">
                                                <STRING>&quot;An empty list allows all surface vehicles to be used&quot;</STRING>
                                            </PROP>
                                            <SETLINKTOOBJ />
                                        </VAR>
                                        <VAR name = "GNSSList">
                                            <PROP name = "EmptyDescription">
                                                <STRING>&quot;An empty list allows all GNSS Systems to be used&quot;</STRING>
                                            </PROP>
                                            <SETLINKTOOBJ />
                                        </VAR>
                                        <VAR name = "MeasTypes">
                                            <PROP name = "EmptyDescription">
                                                <STRING>&quot;An empty list allows all measurement types to be processed&quot;</STRING>
                                            </PROP>
                                            <LIST>
                                                <VAR name = "Measurement Type">
                                                    <STRING>&quot;Range&quot;</STRING>
                                                </VAR>
                                                <VAR name = "Measurement Type">
                                                    <STRING>&quot;Azimuth&quot;</STRING>
                                                </VAR>
                                                <VAR name = "Measurement Type">
                                                    <STRING>&quot;Elevation&quot;</STRING>
                                                </VAR>
                                            </LIST>
                                        </VAR>
                                        <VAR name = "RejectMeasTypes">
                                            <LIST />
                                        </VAR>
                                        <VAR name = "ProcessControl">
                                            <SCOPE Class = "ProcessControl">
                                                <VAR name = "Direction">
                                                    <STRING>&quot;Forward&quot;</STRING>
                                                </VAR>
                                                <VAR name = "StartMode">
                                                    <STRING>&quot;Initial&quot;</STRING>
                                                </VAR>
                                                <VAR name = "StartTime">
                                                    <DATE>29 Jan 1995 02:39:06.000</DATE>
                                                </VAR>
                                                <VAR name = "SelectedRestartTime">
                                                    <STRING>&quot;02 Feb 1995 04:57:26.000 UTCG&quot;</STRING>
                                                </VAR>
                                                <VAR name = "AutoSelectedRestartTime">
                                                    <STRING>&quot;02 Feb 1995 04:57:26.000 UTCG&quot;</STRING>
                                                </VAR>
                                                <VAR name = "RestartLastMeasTime">
                                                    <STRING>&quot;02 Feb 1995 04:57:26.000 UTCG&quot;</STRING>
                                                </VAR>
                                                <VAR name = "StopMode">
                                                    <STRING>&quot;StopTime&quot;</STRING>
                                                </VAR>
                                                <VAR name = "StopTime">
                                                    <DATE>29 Jan 1995 02:40:56.000</DATE>
                                                </VAR>
                                                <VAR name = "TimeSpan">
                                                    <QUANTITY Dimension = "TimeUnit" Unit = "hr">
                                                        <REAL>0.08333333333333333</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "ProcessNoiseUpdateInterval">
                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                        <REAL>2</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "MeasurementProcessingMode">
                                                    <STRING>&quot;Scalar&quot;</STRING>
                                                </VAR>
                                                <VAR name = "MeasurementModelingMode">
                                                    <STRING>&quot;Estimation&quot;</STRING>
                                                </VAR>
                                                <VAR name = "NumOrbitsAllowedForEpochAlignment">
                                                    <INT>15</INT>
                                                </VAR>
                                                <VAR name = "MaxPropTimeAllowedForEpochAlignment">
                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                        <REAL>60</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "EnableVLS">
                                                    <BOOL>true</BOOL>
                                                </VAR>
                                                <VAR name = "MeasUpdateOrbitStateRepresentation">
                                                    <STRING>&quot;Cartesian&quot;</STRING>
                                                </VAR>
                                                <VAR name = "CovarianceUpdateForm">
                                                    <STRING>&quot;OptimalGain&quot;</STRING>
                                                </VAR>
                                                <VAR name = "EnableDeepSpaceMode">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                                <VAR name = "DynamicStateSpace">
                                                    <SCOPE Class = "DynamicStateSpace">
                                                        <VAR name = "MeasBiases">
                                                            <STRING>&quot;Manual&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "FiniteManeuverCorrections">
                                                            <STRING>&quot;Manual&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "CorrelationThreshold">
                                                            <REAL>1e-13</REAL>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "InstantManeuverEstimation">
                                                    <SCOPE Class = "InstantManeuverEstimation">
                                                        <VAR name = "Estimate">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "Formulation">
                                                            <STRING>&quot;Frazer&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "UseMaximumLag">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                        <VAR name = "MaximumLag">
                                                            <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                <REAL>120</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "UseCovarianceReduction">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "MinimumCovarianceReduction">
                                                            <REAL>0.001</REAL>
                                                        </VAR>
                                                        <VAR name = "NumMeasForCovarianceReduction">
                                                            <INT>5</INT>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "HigherOrderCorrections">
                                                    <SCOPE Class = "HigherOrderCorrections">
                                                        <VAR name = "MitigationMethod">
                                                            <STRING>&quot;None&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "SecondOrderGaussian">
                                                            <SCOPE Class = "SecondOrderGaussian">
                                                                <VAR name = "UpdateTypes">
                                                                    <STRING>&quot;MeasurementAndTime&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "MeasUpdateType">
                                                                    <STRING>&quot;ResidualAndDeweight&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "Mode">
                                                                    <STRING>&quot;AlwaysOn&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "MeasUpdateNonlinearDetectionThreshold">
                                                                    <REAL>0.5</REAL>
                                                                </VAR>
                                                                <VAR name = "TimeUpdateNonlinearDetectionThreshold">
                                                                    <REAL>1e-06</REAL>
                                                                </VAR>
                                                                <VAR name = "DeweightingScaleFactor">
                                                                    <REAL>1</REAL>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "Underweighting">
                                                            <SCOPE Class = "Underweighting">
                                                                <VAR name = "Method">
                                                                    <STRING>&quot;ResidualVarianceCorrectionLimit&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "Mode">
                                                                    <STRING>&quot;AlwaysOn&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "ResidualVarianceCorrectionLimit">
                                                                    <REAL>10000</REAL>
                                                                </VAR>
                                                                <VAR name = "ResidualVarianceScaling">
                                                                    <REAL>1</REAL>
                                                                </VAR>
                                                                <VAR name = "MeasUpdateNonlinearDetectionThreshold">
                                                                    <REAL>0.5</REAL>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "UnscentedFilter">
                                                            <SCOPE Class = "UnscentedFilter">
                                                                <VAR name = "UpdateTypes">
                                                                    <STRING>&quot;Measurement&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "CurvilinearUse">
                                                                    <STRING>&quot;None&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "ResampleOnProcessNoiseGrid">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                                <VAR name = "Alpha">
                                                                    <REAL>0.1</REAL>
                                                                </VAR>
                                                                <VAR name = "Beta">
                                                                    <REAL>2</REAL>
                                                                </VAR>
                                                                <VAR name = "Kappa">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "IterateMeasUpdate">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "ResidualToWNIterationThreshold">
                                                            <REAL>1</REAL>
                                                        </VAR>
                                                        <VAR name = "MaxMeasUpdateIterations">
                                                            <INT>3</INT>
                                                        </VAR>
                                                        <VAR name = "RcvrClockPartialsTransition">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "CurrentTime">
                                            <DATE>29 Jan 1995 02:40:56.000</DATE>
                                        </VAR>
                                        <VAR name = "CustomDataEditing">
                                            <SCOPE Class = "CustomDataEditing">
                                                <VAR name = "Enabled">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                                <VAR name = "OverrideValidity">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                                <VAR name = "Schedule">
                                                    <LIST />
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "SigmaEditing">
                                            <SCOPE Class = "SigmaEditing">
                                                <VAR name = "Defaults">
                                                    <SCOPE Class = "SigmaEditing">
                                                        <VAR name = "NominalSigma">
                                                            <REAL>1000</REAL>
                                                        </VAR>
                                                        <VAR name = "Dynamic">
                                                            <SCOPE>
                                                                <VAR name = "Enabled">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                                <VAR name = "HighSigma">
                                                                    <REAL>100</REAL>
                                                                </VAR>
                                                                <VAR name = "NumRejectToStart">
                                                                    <INT>10</INT>
                                                                </VAR>
                                                                <VAR name = "NumAcceptToStop">
                                                                    <INT>3</INT>
                                                                </VAR>
                                                                <VAR name = "InitialHighSigmaDuration">
                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                        <REAL>0</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "CustomSigmas">
                                                    <SCOPE Class = "CustomSigmas">
                                                        <VAR name = "Enabled">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "Schedule">
                                                            <LIST />
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "ResidualEditing">
                                            <SCOPE Class = "ResidualEditing">
                                                <VAR name = "Enabled">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                                <VAR name = "Schedule">
                                                    <LIST />
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "Restart">
                                            <SCOPE>
                                                <VAR name = "SaveRecordsToFile">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                                <VAR name = "MaxRecordsInFile">
                                                    <INT>100</INT>
                                                </VAR>
                                                <VAR name = "SaveFrequency">
                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                        <REAL>60</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "BackupRestartRecords">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                                <VAR name = "StochasticModelUpdates">
                                                    <SCOPE>
                                                        <VAR name = "Source">
                                                            <STRING>&quot;None&quot;</STRING>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "ClockUpdates">
                                                    <SCOPE>
                                                        <VAR name = "Enabled">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "SatelliteMassUpdates">
                                                    <SCOPE>
                                                        <VAR name = "Enabled">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "OnStateSizeChange">
                                                    <SCOPE>
                                                        <VAR name = "StateReductionMethod">
                                                            <STRING>&quot;SimpleTruncation&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "IfCovGoesNegative">
                                                            <SCOPE>
                                                                <VAR name = "Action">
                                                                    <STRING>&quot;PromptUser&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "PercentSigmaDeweighting">
                                                                    <REAL>10</REAL>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "ResetGPSUTCSteering">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "OptionalSolveForParms">
                                            <SCOPE Class = "OptionalSolveForParms">
                                                <VAR name = "MeasBiases">
                                                    <BOOL>true</BOOL>
                                                </VAR>
                                                <VAR name = "UseMeasBiasFile">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                                <VAR name = "MeasBiasCorrectionType">
                                                    <STRING>&quot;CorrectionToConstantBias&quot;</STRING>
                                                </VAR>
                                                <VAR name = "MeasBiasCorrectionFilename">
                                                    <STRING>&quot;&quot;</STRING>
                                                </VAR>
                                                <VAR name = "GlobalAtmosphericDensityEstimation">
                                                    <SCOPE>
                                                        <VAR name = "Mode">
                                                            <STRING>&quot;Nominal&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "Model">
                                                            <STRING>&quot;Jacchia 1970&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "Parameterization">
                                                            <STRING>&quot;Tc_Tx&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "EstimationParameters">
                                                            <LIST>
                                                                <SCOPE>
                                                                    <VAR name = "Name">
                                                                        <STRING>&quot;dTc&quot;</STRING>
                                                                    </VAR>
                                                                    <VAR name = "ParameterizationName">
                                                                        <STRING>&quot;Scalar&quot;</STRING>
                                                                    </VAR>
                                                                    <VAR name = "Coefficients">
                                                                        <LIST>
                                                                            <VAR name = "Coefficient">
                                                                                <SCOPE>
                                                                                    <VAR name = "HalfLife">
                                                                                        <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                                            <REAL>180</REAL>
                                                                                        </QUANTITY>
                                                                                    </VAR>
                                                                                    <VAR name = "Sigma">
                                                                                        <REAL>5</REAL>
                                                                                    </VAR>
                                                                                </SCOPE>
                                                                            </VAR>
                                                                        </LIST>
                                                                    </VAR>
                                                                </SCOPE>
                                                                <SCOPE>
                                                                    <VAR name = "Name">
                                                                        <STRING>&quot;dTx&quot;</STRING>
                                                                    </VAR>
                                                                    <VAR name = "ParameterizationName">
                                                                        <STRING>&quot;Scalar&quot;</STRING>
                                                                    </VAR>
                                                                    <VAR name = "Coefficients">
                                                                        <LIST>
                                                                            <VAR name = "Coefficient">
                                                                                <SCOPE>
                                                                                    <VAR name = "HalfLife">
                                                                                        <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                                            <REAL>180</REAL>
                                                                                        </QUANTITY>
                                                                                    </VAR>
                                                                                    <VAR name = "Sigma">
                                                                                        <REAL>5</REAL>
                                                                                    </VAR>
                                                                                </SCOPE>
                                                                            </VAR>
                                                                        </LIST>
                                                                    </VAR>
                                                                </SCOPE>
                                                            </LIST>
                                                        </VAR>
                                                        <VAR name = "CorrectionFilename">
                                                            <STRING>&quot;&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "LimitCorrectionEpoch">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "LatestCorrectionEpoch">
                                                            <DATE>1 Jan 2000 11:59:27.816</DATE>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "Output">
                                            <SCOPE Class = "Output">
                                                <VAR name = "DataArchive">
                                                    <SCOPE Class = "DataArchive">
                                                        <VAR name = "Filename">
                                                            <STRING>&quot;C:\Users\dvallado\Documents\ODTK 7\DataArchive\Example.filrun&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "FileUpdateMethod">
                                                            <STRING>&quot;Overwrite&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "OutputStateHistory">
                                                            <STRING>&quot;AllTimes&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "EveryNSteps">
                                                            <INT>1</INT>
                                                        </VAR>
                                                        <VAR name = "SaveCrossCorrelations">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                        <VAR name = "SaveOnlyLastMeasPerStep">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                        <VAR name = "OutputMeasHistory">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                        <VAR name = "OutputManeuvers">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                        <VAR name = "OutputEmpiricalForces">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                        <VAR name = "OutputSummary">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                        <VAR name = "OutputDataFiles">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                        <VAR name = "OutputHistograms">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                        <VAR name = "HistogramSize">
                                                            <INT>3</INT>
                                                        </VAR>
                                                        <VAR name = "NumberHistogramBins">
                                                            <INT>22</INT>
                                                        </VAR>
                                                        <VAR name = "OutputGPSSVMeasInfo">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "Display">
                                                    <SCOPE Class = "Display">
                                                        <VAR name = "EveryNMeasUpdates">
                                                            <INT>1</INT>
                                                        </VAR>
                                                        <VAR name = "EveryNTimeUpdates">
                                                            <INT>1</INT>
                                                        </VAR>
                                                        <VAR name = "ShowPassTimes">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                        <VAR name = "OutputClockReductionUpdates">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "ClearMsgLog">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                                <VAR name = "SmootherData">
                                                    <SCOPE Class = "SmootherData">
                                                        <VAR name = "Generate">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                        <VAR name = "Filename">
                                                            <STRING>&quot;C:\Users\dvallado\Documents\ODTK 7\Smoother\Example.rough&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "TimeMode">
                                                            <STRING>&quot;FilterSpan&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "StartTime">
                                                            <DATE>20 Aug 1996 00:00:30.000</DATE>
                                                        </VAR>
                                                        <VAR name = "StopTime">
                                                            <DATE>21 Aug 1996 00:00:30.000</DATE>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "STKEphemeris">
                                                    <SCOPE>
                                                        <VAR name = "DuringProcess">
                                                            <SCOPE>
                                                                <VAR name = "Generate">
                                                                    <BOOL>true</BOOL>
                                                                </VAR>
                                                                <VAR name = "TimeGrid">
                                                                    <STRING>&quot;Uniform&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "MaxTimeStep">
                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                        <REAL>2</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "UniformTimeStep">
                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                        <REAL>2</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "Predict">
                                                            <SCOPE>
                                                                <VAR name = "Generate">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                                <VAR name = "TimeStep">
                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                        <REAL>1</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "AlignTimeGrid">
                                                                    <BOOL>true</BOOL>
                                                                </VAR>
                                                                <VAR name = "StopMode">
                                                                    <STRING>&quot;TimeSpan&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "TimeSpan">
                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                        <REAL>720</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "StopTime">
                                                                    <DATE>2 Jul 2006 00:00:33.000</DATE>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "EphemerisArchiving">
                                                            <STRING>&quot;Final Iteration&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "CoordFrame">
                                                            <LIST>
                                                                <VAR name = "SatCoordFrameList">
                                                                    <SCOPE>
                                                                        <VAR name = "Satellite">
                                                                            <LINKTOOBJ>
                                                                                <STRING>&quot;Sat7734&quot;</STRING>
                                                                            </LINKTOOBJ>
                                                                        </VAR>
                                                                        <VAR name = "CBName">
                                                                            <STRING>&quot;Earth&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "CoordFrame">
                                                                            <STRING>&quot;J2000&quot;</STRING>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                            </LIST>
                                                        </VAR>
                                                        <VAR name = "Acceleration">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "Covariance">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                        <VAR name = "CovarianceType">
                                                            <STRING>&quot;Position 3x3 Covariance&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "CovarianceCoordFrame">
                                                            <STRING>&quot;SameAsEphemeris&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "StateErrorTransition">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "FileFormat">
                                                            <STRING>&quot;STK Ephemeris&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "OutputDirectory">
                                                            <STRING>&quot;C:\Users\dvallado\Documents\ODTK 7\Ephemeris&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "FileNamingOption">
                                                            <STRING>&quot;ProcessStart&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "Files">
                                                            <LIST>
                                                                <VAR name = "EphemInfo">
                                                                    <SCOPE>
                                                                        <VAR name = "Satellite">
                                                                            <STRING>&quot;Sat7734&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Filename">
                                                                            <STRING>&quot;C:\Users\dvallado\Documents\ODTK 7\Ephemeris\Sat_Sat7734_Fil_19950129_023837.e&quot;</STRING>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                            </LIST>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "SP3Ephemeris">
                                                    <SCOPE>
                                                        <VAR name = "DuringProcess">
                                                            <SCOPE>
                                                                <VAR name = "Generate">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "Predict">
                                                            <SCOPE>
                                                                <VAR name = "Generate">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "Outputs">
                                                            <STRING>&quot;Position Only&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "TimeStep">
                                                            <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                <REAL>15</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "CombineGNSSSystems">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "CentralBodyEphemeris">
                                                    <SCOPE>
                                                        <VAR name = "DuringProcess">
                                                            <SCOPE>
                                                                <VAR name = "Generate">
                                                                    <BOOL>true</BOOL>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "Predict">
                                                            <SCOPE>
                                                                <VAR name = "Generate">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "FileFormat">
                                                            <STRING>&quot;SPICE bsp&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "Files">
                                                            <LIST />
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "Debug">
                                                    <SCOPE Class = "Debug">
                                                        <VAR name = "Matrices">
                                                            <SCOPE Class = "Matrices">
                                                                <VAR name = "Generate">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                                <VAR name = "State">
                                                                    <BOOL>true</BOOL>
                                                                </VAR>
                                                                <VAR name = "Covariance">
                                                                    <BOOL>true</BOOL>
                                                                </VAR>
                                                                <VAR name = "StateErrorTransition">
                                                                    <BOOL>true</BOOL>
                                                                </VAR>
                                                                <VAR name = "MeasurementPartials">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                                <VAR name = "FilterGainMatrix">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                                <VAR name = "Filename">
                                                                    <STRING>&quot;C:\Users\dvallado\Documents\ODTK 7\DataArchive\Filter7734_FilterDebug.txt&quot;</STRING>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "Eigenvalues">
                                                            <SCOPE Class = "Eigenvalues">
                                                                <VAR name = "Generate">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                                <VAR name = "Filename">
                                                                    <STRING>&quot;C:\Users\dvallado\Documents\ODTK 7\DataArchive\Filter7734_EigenValues.txt&quot;</STRING>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "SecondOrder">
                                                            <SCOPE Class = "SecondOrder">
                                                                <VAR name = "Generate">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                                <VAR name = "Filename">
                                                                    <STRING>&quot;C:\Users\dvallado\Documents\ODTK 7\DataArchive\Filter7734_SecondOrder.txt&quot;</STRING>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "Events">
                                            <SCOPE>
                                                <VAR name = "OnInternalError">
                                                    <STRING>&quot;C:\Program Files\AGI\ODTK 7\ODTK\AppData\Scripts\Event_Controls\DoNothing.vbs&quot;</STRING>
                                                </VAR>
                                                <VAR name = "OnResume">
                                                    <STRING>&quot;C:\Program Files\AGI\ODTK 7\ODTK\AppData\Scripts\Event_Controls\DoNothing.vbs&quot;</STRING>
                                                </VAR>
                                                <VAR name = "OnComplete">
                                                    <STRING>&quot;C:\Program Files\AGI\ODTK 7\ODTK\AppData\Scripts\Event_Controls\DoNothing.vbs&quot;</STRING>
                                                </VAR>
                                                <VAR name = "OnHalt">
                                                    <STRING>&quot;C:\Program Files\AGI\ODTK 7\ODTK\AppData\Scripts\Event_Controls\DoNothing.vbs&quot;</STRING>
                                                </VAR>
                                                <VAR name = "OnNoMoreMeas">
                                                    <STRING>&quot;C:\Program Files\AGI\ODTK 7\ODTK\AppData\Scripts\Event_Controls\DoNothing.vbs&quot;</STRING>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "Children">
                                            <SCOPE />
                                        </VAR>
                                    </SCOPE>
                                </VAR>
                                <VAR name = "Filter7734Long">
                                    <SCOPE Class = "Filter">
                                        <PROP name = "version">
                                            <STRING>&quot;7.7&quot;</STRING>
                                        </PROP>
                                        <VAR name = "Description">
                                            <STRING>&quot;&quot;</STRING>
                                        </VAR>
                                        <VAR name = "SatelliteList">
                                            <PROP name = "EmptyDescription">
                                                <STRING>&quot;An empty list allows all satellites to be used&quot;</STRING>
                                            </PROP>
                                            <SETLINKTOOBJ>
                                                <STRING>&quot;Sat7734&quot;</STRING>
                                            </SETLINKTOOBJ>
                                        </VAR>
                                        <VAR name = "TrackerList">
                                            <PROP name = "EmptyDescription">
                                                <STRING>&quot;An empty list allows all trackers to be used&quot;</STRING>
                                            </PROP>
                                            <SETLINKTOOBJ>
                                                <STRING>&quot;SSNTrackingSystem.KPTQ&quot;</STRING>
                                            </SETLINKTOOBJ>
                                        </VAR>
                                        <VAR name = "EmitterList">
                                            <PROP name = "EmptyDescription">
                                                <STRING>&quot;An empty list allows all emitters to be used&quot;</STRING>
                                            </PROP>
                                            <SETLINKTOOBJ />
                                        </VAR>
                                        <VAR name = "SurfaceVehicleList">
                                            <PROP name = "EmptyDescription">
                                                <STRING>&quot;An empty list allows all surface vehicles to be used&quot;</STRING>
                                            </PROP>
                                            <SETLINKTOOBJ />
                                        </VAR>
                                        <VAR name = "GNSSList">
                                            <PROP name = "EmptyDescription">
                                                <STRING>&quot;An empty list allows all GNSS Systems to be used&quot;</STRING>
                                            </PROP>
                                            <SETLINKTOOBJ />
                                        </VAR>
                                        <VAR name = "MeasTypes">
                                            <PROP name = "EmptyDescription">
                                                <STRING>&quot;An empty list allows all measurement types to be processed&quot;</STRING>
                                            </PROP>
                                            <LIST>
                                                <VAR name = "Measurement Type">
                                                    <STRING>&quot;Range&quot;</STRING>
                                                </VAR>
                                                <VAR name = "Measurement Type">
                                                    <STRING>&quot;Azimuth&quot;</STRING>
                                                </VAR>
                                                <VAR name = "Measurement Type">
                                                    <STRING>&quot;Elevation&quot;</STRING>
                                                </VAR>
                                            </LIST>
                                        </VAR>
                                        <VAR name = "RejectMeasTypes">
                                            <LIST />
                                        </VAR>
                                        <VAR name = "ProcessControl">
                                            <SCOPE Class = "ProcessControl">
                                                <VAR name = "Direction">
                                                    <STRING>&quot;Forward&quot;</STRING>
                                                </VAR>
                                                <VAR name = "StartMode">
                                                    <STRING>&quot;Initial&quot;</STRING>
                                                </VAR>
                                                <VAR name = "StartTime">
                                                    <DATE>29 Jan 1995 02:39:06.000</DATE>
                                                </VAR>
                                                <VAR name = "SelectedRestartTime">
                                                    <STRING>&quot;02 Feb 1995 04:57:26.000 UTCG&quot;</STRING>
                                                </VAR>
                                                <VAR name = "AutoSelectedRestartTime">
                                                    <STRING>&quot;02 Feb 1995 04:57:26.000 UTCG&quot;</STRING>
                                                </VAR>
                                                <VAR name = "RestartLastMeasTime">
                                                    <STRING>&quot;02 Feb 1995 04:57:26.000 UTCG&quot;</STRING>
                                                </VAR>
                                                <VAR name = "StopMode">
                                                    <STRING>&quot;LastMeasurement&quot;</STRING>
                                                </VAR>
                                                <VAR name = "StopTime">
                                                    <DATE>21 Aug 1996 00:00:30.000</DATE>
                                                </VAR>
                                                <VAR name = "TimeSpan">
                                                    <QUANTITY Dimension = "TimeUnit" Unit = "hr">
                                                        <REAL>0.08333333333333333</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "ProcessNoiseUpdateInterval">
                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                        <REAL>2</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "MeasurementProcessingMode">
                                                    <STRING>&quot;Scalar&quot;</STRING>
                                                </VAR>
                                                <VAR name = "MeasurementModelingMode">
                                                    <STRING>&quot;Estimation&quot;</STRING>
                                                </VAR>
                                                <VAR name = "NumOrbitsAllowedForEpochAlignment">
                                                    <INT>15</INT>
                                                </VAR>
                                                <VAR name = "MaxPropTimeAllowedForEpochAlignment">
                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                        <REAL>60</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "EnableVLS">
                                                    <BOOL>true</BOOL>
                                                </VAR>
                                                <VAR name = "MeasUpdateOrbitStateRepresentation">
                                                    <STRING>&quot;Cartesian&quot;</STRING>
                                                </VAR>
                                                <VAR name = "CovarianceUpdateForm">
                                                    <STRING>&quot;OptimalGain&quot;</STRING>
                                                </VAR>
                                                <VAR name = "EnableDeepSpaceMode">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                                <VAR name = "DynamicStateSpace">
                                                    <SCOPE Class = "DynamicStateSpace">
                                                        <VAR name = "MeasBiases">
                                                            <STRING>&quot;Manual&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "FiniteManeuverCorrections">
                                                            <STRING>&quot;Manual&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "CorrelationThreshold">
                                                            <REAL>1e-13</REAL>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "InstantManeuverEstimation">
                                                    <SCOPE Class = "InstantManeuverEstimation">
                                                        <VAR name = "Estimate">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "Formulation">
                                                            <STRING>&quot;Frazer&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "UseMaximumLag">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                        <VAR name = "MaximumLag">
                                                            <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                <REAL>120</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "UseCovarianceReduction">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "MinimumCovarianceReduction">
                                                            <REAL>0.001</REAL>
                                                        </VAR>
                                                        <VAR name = "NumMeasForCovarianceReduction">
                                                            <INT>5</INT>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "HigherOrderCorrections">
                                                    <SCOPE Class = "HigherOrderCorrections">
                                                        <VAR name = "MitigationMethod">
                                                            <STRING>&quot;None&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "SecondOrderGaussian">
                                                            <SCOPE Class = "SecondOrderGaussian">
                                                                <VAR name = "UpdateTypes">
                                                                    <STRING>&quot;MeasurementAndTime&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "MeasUpdateType">
                                                                    <STRING>&quot;ResidualAndDeweight&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "Mode">
                                                                    <STRING>&quot;AlwaysOn&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "MeasUpdateNonlinearDetectionThreshold">
                                                                    <REAL>0.5</REAL>
                                                                </VAR>
                                                                <VAR name = "TimeUpdateNonlinearDetectionThreshold">
                                                                    <REAL>1e-06</REAL>
                                                                </VAR>
                                                                <VAR name = "DeweightingScaleFactor">
                                                                    <REAL>1</REAL>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "Underweighting">
                                                            <SCOPE Class = "Underweighting">
                                                                <VAR name = "Method">
                                                                    <STRING>&quot;ResidualVarianceCorrectionLimit&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "Mode">
                                                                    <STRING>&quot;AlwaysOn&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "ResidualVarianceCorrectionLimit">
                                                                    <REAL>10000</REAL>
                                                                </VAR>
                                                                <VAR name = "ResidualVarianceScaling">
                                                                    <REAL>1</REAL>
                                                                </VAR>
                                                                <VAR name = "MeasUpdateNonlinearDetectionThreshold">
                                                                    <REAL>0.5</REAL>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "UnscentedFilter">
                                                            <SCOPE Class = "UnscentedFilter">
                                                                <VAR name = "UpdateTypes">
                                                                    <STRING>&quot;Measurement&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "CurvilinearUse">
                                                                    <STRING>&quot;None&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "ResampleOnProcessNoiseGrid">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                                <VAR name = "Alpha">
                                                                    <REAL>0.1</REAL>
                                                                </VAR>
                                                                <VAR name = "Beta">
                                                                    <REAL>2</REAL>
                                                                </VAR>
                                                                <VAR name = "Kappa">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "IterateMeasUpdate">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "ResidualToWNIterationThreshold">
                                                            <REAL>1</REAL>
                                                        </VAR>
                                                        <VAR name = "MaxMeasUpdateIterations">
                                                            <INT>3</INT>
                                                        </VAR>
                                                        <VAR name = "RcvrClockPartialsTransition">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "CurrentTime">
                                            <DATE>2 Feb 1995 04:57:55.000</DATE>
                                        </VAR>
                                        <VAR name = "CustomDataEditing">
                                            <SCOPE Class = "CustomDataEditing">
                                                <VAR name = "Enabled">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                                <VAR name = "OverrideValidity">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                                <VAR name = "Schedule">
                                                    <LIST />
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "SigmaEditing">
                                            <SCOPE Class = "SigmaEditing">
                                                <VAR name = "Defaults">
                                                    <SCOPE Class = "SigmaEditing">
                                                        <VAR name = "NominalSigma">
                                                            <REAL>3</REAL>
                                                        </VAR>
                                                        <VAR name = "Dynamic">
                                                            <SCOPE>
                                                                <VAR name = "Enabled">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                                <VAR name = "HighSigma">
                                                                    <REAL>100</REAL>
                                                                </VAR>
                                                                <VAR name = "NumRejectToStart">
                                                                    <INT>10</INT>
                                                                </VAR>
                                                                <VAR name = "NumAcceptToStop">
                                                                    <INT>3</INT>
                                                                </VAR>
                                                                <VAR name = "InitialHighSigmaDuration">
                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                        <REAL>0</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "CustomSigmas">
                                                    <SCOPE Class = "CustomSigmas">
                                                        <VAR name = "Enabled">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "Schedule">
                                                            <LIST />
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "ResidualEditing">
                                            <SCOPE Class = "ResidualEditing">
                                                <VAR name = "Enabled">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                                <VAR name = "Schedule">
                                                    <LIST />
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "Restart">
                                            <SCOPE>
                                                <VAR name = "SaveRecordsToFile">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                                <VAR name = "MaxRecordsInFile">
                                                    <INT>100</INT>
                                                </VAR>
                                                <VAR name = "SaveFrequency">
                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                        <REAL>60</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "BackupRestartRecords">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                                <VAR name = "StochasticModelUpdates">
                                                    <SCOPE>
                                                        <VAR name = "Source">
                                                            <STRING>&quot;None&quot;</STRING>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "ClockUpdates">
                                                    <SCOPE>
                                                        <VAR name = "Enabled">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "SatelliteMassUpdates">
                                                    <SCOPE>
                                                        <VAR name = "Enabled">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "OnStateSizeChange">
                                                    <SCOPE>
                                                        <VAR name = "StateReductionMethod">
                                                            <STRING>&quot;SimpleTruncation&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "IfCovGoesNegative">
                                                            <SCOPE>
                                                                <VAR name = "Action">
                                                                    <STRING>&quot;PromptUser&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "PercentSigmaDeweighting">
                                                                    <REAL>10</REAL>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "ResetGPSUTCSteering">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "OptionalSolveForParms">
                                            <SCOPE Class = "OptionalSolveForParms">
                                                <VAR name = "MeasBiases">
                                                    <BOOL>true</BOOL>
                                                </VAR>
                                                <VAR name = "UseMeasBiasFile">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                                <VAR name = "MeasBiasCorrectionType">
                                                    <STRING>&quot;CorrectionToConstantBias&quot;</STRING>
                                                </VAR>
                                                <VAR name = "MeasBiasCorrectionFilename">
                                                    <STRING>&quot;&quot;</STRING>
                                                </VAR>
                                                <VAR name = "GlobalAtmosphericDensityEstimation">
                                                    <SCOPE>
                                                        <VAR name = "Mode">
                                                            <STRING>&quot;Nominal&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "Model">
                                                            <STRING>&quot;Jacchia 1970&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "Parameterization">
                                                            <STRING>&quot;Tc_Tx&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "EstimationParameters">
                                                            <LIST>
                                                                <SCOPE>
                                                                    <VAR name = "Name">
                                                                        <STRING>&quot;dTc&quot;</STRING>
                                                                    </VAR>
                                                                    <VAR name = "ParameterizationName">
                                                                        <STRING>&quot;Scalar&quot;</STRING>
                                                                    </VAR>
                                                                    <VAR name = "Coefficients">
                                                                        <LIST>
                                                                            <VAR name = "Coefficient">
                                                                                <SCOPE>
                                                                                    <VAR name = "HalfLife">
                                                                                        <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                                            <REAL>180</REAL>
                                                                                        </QUANTITY>
                                                                                    </VAR>
                                                                                    <VAR name = "Sigma">
                                                                                        <REAL>5</REAL>
                                                                                    </VAR>
                                                                                </SCOPE>
                                                                            </VAR>
                                                                        </LIST>
                                                                    </VAR>
                                                                </SCOPE>
                                                                <SCOPE>
                                                                    <VAR name = "Name">
                                                                        <STRING>&quot;dTx&quot;</STRING>
                                                                    </VAR>
                                                                    <VAR name = "ParameterizationName">
                                                                        <STRING>&quot;Scalar&quot;</STRING>
                                                                    </VAR>
                                                                    <VAR name = "Coefficients">
                                                                        <LIST>
                                                                            <VAR name = "Coefficient">
                                                                                <SCOPE>
                                                                                    <VAR name = "HalfLife">
                                                                                        <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                                            <REAL>180</REAL>
                                                                                        </QUANTITY>
                                                                                    </VAR>
                                                                                    <VAR name = "Sigma">
                                                                                        <REAL>5</REAL>
                                                                                    </VAR>
                                                                                </SCOPE>
                                                                            </VAR>
                                                                        </LIST>
                                                                    </VAR>
                                                                </SCOPE>
                                                            </LIST>
                                                        </VAR>
                                                        <VAR name = "CorrectionFilename">
                                                            <STRING>&quot;&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "LimitCorrectionEpoch">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "LatestCorrectionEpoch">
                                                            <DATE>1 Jan 2000 11:59:27.816</DATE>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "Output">
                                            <SCOPE Class = "Output">
                                                <VAR name = "DataArchive">
                                                    <SCOPE Class = "DataArchive">
                                                        <VAR name = "Filename">
                                                            <STRING>&quot;C:\Users\dvallado\Documents\ODTK 7\DataArchive\Example.filrun&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "FileUpdateMethod">
                                                            <STRING>&quot;Overwrite&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "OutputStateHistory">
                                                            <STRING>&quot;AllTimes&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "EveryNSteps">
                                                            <INT>1</INT>
                                                        </VAR>
                                                        <VAR name = "SaveCrossCorrelations">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                        <VAR name = "SaveOnlyLastMeasPerStep">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                        <VAR name = "OutputMeasHistory">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                        <VAR name = "OutputManeuvers">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                        <VAR name = "OutputEmpiricalForces">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                        <VAR name = "OutputSummary">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                        <VAR name = "OutputDataFiles">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                        <VAR name = "OutputHistograms">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                        <VAR name = "HistogramSize">
                                                            <INT>3</INT>
                                                        </VAR>
                                                        <VAR name = "NumberHistogramBins">
                                                            <INT>22</INT>
                                                        </VAR>
                                                        <VAR name = "OutputGPSSVMeasInfo">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "Display">
                                                    <SCOPE Class = "Display">
                                                        <VAR name = "EveryNMeasUpdates">
                                                            <INT>1</INT>
                                                        </VAR>
                                                        <VAR name = "EveryNTimeUpdates">
                                                            <INT>1</INT>
                                                        </VAR>
                                                        <VAR name = "ShowPassTimes">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                        <VAR name = "OutputClockReductionUpdates">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "ClearMsgLog">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                                <VAR name = "SmootherData">
                                                    <SCOPE Class = "SmootherData">
                                                        <VAR name = "Generate">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                        <VAR name = "Filename">
                                                            <STRING>&quot;C:\Users\dvallado\Documents\ODTK 7\Smoother\Example.rough&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "TimeMode">
                                                            <STRING>&quot;FilterSpan&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "StartTime">
                                                            <DATE>20 Aug 1996 00:00:30.000</DATE>
                                                        </VAR>
                                                        <VAR name = "StopTime">
                                                            <DATE>21 Aug 1996 00:00:30.000</DATE>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "STKEphemeris">
                                                    <SCOPE>
                                                        <VAR name = "DuringProcess">
                                                            <SCOPE>
                                                                <VAR name = "Generate">
                                                                    <BOOL>true</BOOL>
                                                                </VAR>
                                                                <VAR name = "TimeGrid">
                                                                    <STRING>&quot;Uniform&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "MaxTimeStep">
                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                        <REAL>2</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "UniformTimeStep">
                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                        <REAL>2</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "Predict">
                                                            <SCOPE>
                                                                <VAR name = "Generate">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                                <VAR name = "TimeStep">
                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                        <REAL>1</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "AlignTimeGrid">
                                                                    <BOOL>true</BOOL>
                                                                </VAR>
                                                                <VAR name = "StopMode">
                                                                    <STRING>&quot;TimeSpan&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "TimeSpan">
                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                        <REAL>720</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "StopTime">
                                                                    <DATE>2 Jul 2006 00:00:33.000</DATE>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "EphemerisArchiving">
                                                            <STRING>&quot;Final Iteration&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "CoordFrame">
                                                            <LIST>
                                                                <VAR name = "SatCoordFrameList">
                                                                    <SCOPE>
                                                                        <VAR name = "Satellite">
                                                                            <LINKTOOBJ>
                                                                                <STRING>&quot;Sat7734&quot;</STRING>
                                                                            </LINKTOOBJ>
                                                                        </VAR>
                                                                        <VAR name = "CBName">
                                                                            <STRING>&quot;Earth&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "CoordFrame">
                                                                            <STRING>&quot;J2000&quot;</STRING>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                            </LIST>
                                                        </VAR>
                                                        <VAR name = "Acceleration">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "Covariance">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                        <VAR name = "CovarianceType">
                                                            <STRING>&quot;Position 3x3 Covariance&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "CovarianceCoordFrame">
                                                            <STRING>&quot;SameAsEphemeris&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "StateErrorTransition">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "FileFormat">
                                                            <STRING>&quot;STK Ephemeris&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "OutputDirectory">
                                                            <STRING>&quot;C:\Users\dvallado\Documents\ODTK 7\Ephemeris&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "FileNamingOption">
                                                            <STRING>&quot;ProcessStart&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "Files">
                                                            <LIST>
                                                                <VAR name = "EphemInfo">
                                                                    <SCOPE>
                                                                        <VAR name = "Satellite">
                                                                            <STRING>&quot;Sat7734&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Filename">
                                                                            <STRING>&quot;C:\STKODFiles\Ephemeris\Sat_Sat7734_Fil_19950129_023837.e&quot;</STRING>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                            </LIST>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "SP3Ephemeris">
                                                    <SCOPE>
                                                        <VAR name = "DuringProcess">
                                                            <SCOPE>
                                                                <VAR name = "Generate">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "Predict">
                                                            <SCOPE>
                                                                <VAR name = "Generate">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "Outputs">
                                                            <STRING>&quot;Position Only&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "TimeStep">
                                                            <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                <REAL>15</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "CombineGNSSSystems">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "CentralBodyEphemeris">
                                                    <SCOPE>
                                                        <VAR name = "DuringProcess">
                                                            <SCOPE>
                                                                <VAR name = "Generate">
                                                                    <BOOL>true</BOOL>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "Predict">
                                                            <SCOPE>
                                                                <VAR name = "Generate">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "FileFormat">
                                                            <STRING>&quot;SPICE bsp&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "Files">
                                                            <LIST />
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "Debug">
                                                    <SCOPE Class = "Debug">
                                                        <VAR name = "Matrices">
                                                            <SCOPE Class = "Matrices">
                                                                <VAR name = "Generate">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                                <VAR name = "State">
                                                                    <BOOL>true</BOOL>
                                                                </VAR>
                                                                <VAR name = "Covariance">
                                                                    <BOOL>true</BOOL>
                                                                </VAR>
                                                                <VAR name = "StateErrorTransition">
                                                                    <BOOL>true</BOOL>
                                                                </VAR>
                                                                <VAR name = "MeasurementPartials">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                                <VAR name = "FilterGainMatrix">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                                <VAR name = "Filename">
                                                                    <STRING>&quot;C:\Users\dvallado\Documents\ODTK 7\DataArchive\Filter7734Long_FilterDebug.txt&quot;</STRING>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "Eigenvalues">
                                                            <SCOPE Class = "Eigenvalues">
                                                                <VAR name = "Generate">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                                <VAR name = "Filename">
                                                                    <STRING>&quot;C:\Users\dvallado\Documents\ODTK 7\DataArchive\Filter7734Long_EigenValues.txt&quot;</STRING>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "SecondOrder">
                                                            <SCOPE Class = "SecondOrder">
                                                                <VAR name = "Generate">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                                <VAR name = "Filename">
                                                                    <STRING>&quot;C:\Users\dvallado\Documents\ODTK 7\DataArchive\Filter7734Long_SecondOrder.txt&quot;</STRING>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "Events">
                                            <SCOPE>
                                                <VAR name = "OnInternalError">
                                                    <STRING>&quot;C:\Program Files\AGI\ODTK 7\ODTK\AppData\Scripts\Event_Controls\DoNothing.vbs&quot;</STRING>
                                                </VAR>
                                                <VAR name = "OnResume">
                                                    <STRING>&quot;C:\Program Files\AGI\ODTK 7\ODTK\AppData\Scripts\Event_Controls\DoNothing.vbs&quot;</STRING>
                                                </VAR>
                                                <VAR name = "OnComplete">
                                                    <STRING>&quot;C:\Program Files\AGI\ODTK 7\ODTK\AppData\Scripts\Event_Controls\DoNothing.vbs&quot;</STRING>
                                                </VAR>
                                                <VAR name = "OnHalt">
                                                    <STRING>&quot;C:\Program Files\AGI\ODTK 7\ODTK\AppData\Scripts\Event_Controls\DoNothing.vbs&quot;</STRING>
                                                </VAR>
                                                <VAR name = "OnNoMoreMeas">
                                                    <STRING>&quot;C:\Program Files\AGI\ODTK 7\ODTK\AppData\Scripts\Event_Controls\DoNothing.vbs&quot;</STRING>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "Children">
                                            <SCOPE />
                                        </VAR>
                                    </SCOPE>
                                </VAR>
                            </SCOPE>
                        </VAR>
                        <VAR name = "Smoother">
                            <SCOPE>
                                <VAR name = "Smoother1">
                                    <SCOPE Class = "Smoother">
                                        <PROP name = "version">
                                            <STRING>&quot;7.7&quot;</STRING>
                                        </PROP>
                                        <VAR name = "Description">
                                            <STRING>&quot;&quot;</STRING>
                                        </VAR>
                                        <VAR name = "Input">
                                            <SCOPE>
                                                <VAR name = "Files">
                                                    <LIST>
                                                        <VAR name = "RoughFile">
                                                            <SCOPE>
                                                                <VAR name = "Enabled">
                                                                    <BOOL>true</BOOL>
                                                                </VAR>
                                                                <VAR name = "Filename">
                                                                    <STRING>&quot;C:\Users\dvallado\Documents\ODTK 7\Smoother\Example.rough&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "StartTime">
                                                                    <DATE>29 Jan 1995 02:39:06.000</DATE>
                                                                </VAR>
                                                                <VAR name = "StopTime">
                                                                    <DATE>29 Jan 1995 02:40:56.000</DATE>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                    </LIST>
                                                </VAR>
                                                <VAR name = "Remove">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "ProcessControl">
                                            <SCOPE Class = "ProcessControl">
                                                <VAR name = "StateTransitionMode">
                                                    <STRING>&quot;Nonlinear&quot;</STRING>
                                                </VAR>
                                                <VAR name = "StartMode">
                                                    <STRING>&quot;LatestFilterTime&quot;</STRING>
                                                </VAR>
                                                <VAR name = "StopMode">
                                                    <STRING>&quot;EarliestFilterTime&quot;</STRING>
                                                </VAR>
                                                <VAR name = "TimeSpan">
                                                    <QUANTITY Dimension = "TimeUnit" Unit = "hr">
                                                        <REAL>24</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "OutputLag">
                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                        <REAL>0</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "OrbitTypeDivergenceCheck">
                                                    <BOOL>true</BOOL>
                                                </VAR>
                                                <VAR name = "GlobalAtmosphericDensityEstimation">
                                                    <SCOPE>
                                                        <VAR name = "Mode">
                                                            <STRING>&quot;Nominal&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "Model">
                                                            <STRING>&quot;Jacchia 1970&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "Parameterization">
                                                            <STRING>&quot;Tc_Tx&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "EstimationParameters">
                                                            <LIST>
                                                                <SCOPE>
                                                                    <VAR name = "Name">
                                                                        <STRING>&quot;dTc&quot;</STRING>
                                                                    </VAR>
                                                                    <VAR name = "ParameterizationName">
                                                                        <STRING>&quot;Scalar&quot;</STRING>
                                                                    </VAR>
                                                                    <VAR name = "Coefficients">
                                                                        <LIST>
                                                                            <VAR name = "Coefficient">
                                                                                <SCOPE>
                                                                                    <VAR name = "HalfLife">
                                                                                        <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                                            <REAL>180</REAL>
                                                                                        </QUANTITY>
                                                                                    </VAR>
                                                                                    <VAR name = "Sigma">
                                                                                        <REAL>5</REAL>
                                                                                    </VAR>
                                                                                </SCOPE>
                                                                            </VAR>
                                                                        </LIST>
                                                                    </VAR>
                                                                </SCOPE>
                                                                <SCOPE>
                                                                    <VAR name = "Name">
                                                                        <STRING>&quot;dTx&quot;</STRING>
                                                                    </VAR>
                                                                    <VAR name = "ParameterizationName">
                                                                        <STRING>&quot;Scalar&quot;</STRING>
                                                                    </VAR>
                                                                    <VAR name = "Coefficients">
                                                                        <LIST>
                                                                            <VAR name = "Coefficient">
                                                                                <SCOPE>
                                                                                    <VAR name = "HalfLife">
                                                                                        <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                                            <REAL>180</REAL>
                                                                                        </QUANTITY>
                                                                                    </VAR>
                                                                                    <VAR name = "Sigma">
                                                                                        <REAL>5</REAL>
                                                                                    </VAR>
                                                                                </SCOPE>
                                                                            </VAR>
                                                                        </LIST>
                                                                    </VAR>
                                                                </SCOPE>
                                                            </LIST>
                                                        </VAR>
                                                        <VAR name = "CorrectionFilename">
                                                            <STRING>&quot;&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "LimitCorrectionEpoch">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "LatestCorrectionEpoch">
                                                            <DATE>1 Jan 2000 11:59:27.816</DATE>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "Output">
                                            <SCOPE>
                                                <VAR name = "DataArchive">
                                                    <SCOPE Class = "DataArchive">
                                                        <VAR name = "Filename">
                                                            <STRING>&quot;C:\Users\dvallado\Documents\ODTK 7\DataArchive\Example.smtrun&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "OutputStateHistory">
                                                            <STRING>&quot;AllTimes&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "EveryNSteps">
                                                            <INT>1</INT>
                                                        </VAR>
                                                        <VAR name = "SaveCrossCorrelations">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                        <VAR name = "OutputManeuvers">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                        <VAR name = "OutputEmpiricalForces">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                        <VAR name = "OutputDataFiles">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "STKEphemeris">
                                                    <SCOPE>
                                                        <VAR name = "DuringProcess">
                                                            <SCOPE>
                                                                <VAR name = "Generate">
                                                                    <BOOL>true</BOOL>
                                                                </VAR>
                                                                <VAR name = "TimeGrid">
                                                                    <STRING>&quot;Uniform&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "MaxTimeStep">
                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                        <REAL>2</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "UniformTimeStep">
                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                        <REAL>2</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "Predict">
                                                            <SCOPE>
                                                                <VAR name = "Generate">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                                <VAR name = "TimeStep">
                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                        <REAL>1</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "AlignTimeGrid">
                                                                    <BOOL>true</BOOL>
                                                                </VAR>
                                                                <VAR name = "StopMode">
                                                                    <STRING>&quot;TimeSpan&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "TimeSpan">
                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                        <REAL>720</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "StopTime">
                                                                    <DATE>30 Jun 2000 23:59:27.816</DATE>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "EphemerisArchiving">
                                                            <STRING>&quot;Final Iteration&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "CoordFrame">
                                                            <LIST>
                                                                <VAR name = "SatCoordFrameList">
                                                                    <SCOPE>
                                                                        <VAR name = "Satellite">
                                                                            <LINKTOOBJ>
                                                                                <STRING>&quot;Sat7734&quot;</STRING>
                                                                            </LINKTOOBJ>
                                                                        </VAR>
                                                                        <VAR name = "CBName">
                                                                            <STRING>&quot;Earth&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "CoordFrame">
                                                                            <STRING>&quot;J2000&quot;</STRING>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                            </LIST>
                                                        </VAR>
                                                        <VAR name = "Acceleration">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "Covariance">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                        <VAR name = "CovarianceType">
                                                            <STRING>&quot;Position 3x3 Covariance&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "CovarianceCoordFrame">
                                                            <STRING>&quot;SameAsEphemeris&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "StateErrorTransition">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "FileFormat">
                                                            <STRING>&quot;STK Ephemeris&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "OutputDirectory">
                                                            <STRING>&quot;C:\Users\dvallado\Documents\ODTK 7\Ephemeris&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "FileNamingOption">
                                                            <STRING>&quot;ProcessStart&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "Files">
                                                            <LIST>
                                                                <VAR name = "EphemInfo">
                                                                    <SCOPE>
                                                                        <VAR name = "Satellite">
                                                                            <STRING>&quot;Sat7734&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Filename">
                                                                            <STRING>&quot;C:\Users\dvallado\Documents\ODTK 7\Ephemeris\Sat_Sat7734_Smooth_19950129_023837.e&quot;</STRING>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                            </LIST>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "SP3Ephemeris">
                                                    <SCOPE>
                                                        <VAR name = "DuringProcess">
                                                            <SCOPE>
                                                                <VAR name = "Generate">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "Predict">
                                                            <SCOPE>
                                                                <VAR name = "Generate">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "Outputs">
                                                            <STRING>&quot;Position Only&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "TimeStep">
                                                            <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                <REAL>15</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "CombineGNSSSystems">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "CentralBodyEphemeris">
                                                    <SCOPE>
                                                        <VAR name = "DuringProcess">
                                                            <SCOPE>
                                                                <VAR name = "Generate">
                                                                    <BOOL>true</BOOL>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "Predict">
                                                            <SCOPE>
                                                                <VAR name = "Generate">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "FileFormat">
                                                            <STRING>&quot;SPICE bsp&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "Files">
                                                            <LIST />
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "FilterDifferencingControls">
                                                    <SCOPE>
                                                        <VAR name = "Generate">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                        <VAR name = "Filename">
                                                            <STRING>&quot;C:\Users\dvallado\Documents\ODTK 7\DataArchive\Example.difrun&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "SaveCrossCorrelations">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "Debug">
                                                    <SCOPE Class = "Debug">
                                                        <VAR name = "Eigenvalues">
                                                            <SCOPE Class = "Eigenvalues">
                                                                <VAR name = "Generate">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                                <VAR name = "Filename">
                                                                    <STRING>&quot;C:\Users\dvallado\Documents\ODTK 7\DataArchive\Smoother1_EigenValues.txt&quot;</STRING>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "Children">
                                            <SCOPE />
                                        </VAR>
                                    </SCOPE>
                                </VAR>
                            </SCOPE>
                        </VAR>
                    </SCOPE>
                </VAR>
            </SCOPE>
        </VAR>
    </SCOPE>
</VAR>