<?xml version="1.0" encoding="ISO-8859-1"?> 
<StyledLayerDescriptor version="1.0.0" 
                       xsi:schemaLocation="http://www.opengis.net/sld StyledLayerDescriptor.xsd" 
                       xmlns="http://www.opengis.net/sld" 
                       xmlns:ogc="http://www.opengis.net/ogc" 
                       xmlns:xlink="http://www.w3.org/1999/xlink" 
                       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"> 
	<!-- a Named Layer is the basic building block of an SLD document --> 
	<NamedLayer> 
		<Name>boundary_polygon</Name> 
		<UserStyle> 
			<!-- Styles can have names, titles and abstracts --> 
			<Title>Boundary Polygon</Title> 
			<Abstract>Boundary style that draws a polygon</Abstract> 
			<FeatureTypeStyle> 
				<Rule> 
					<Name>rule1</Name> 
					<Title>Districts</Title> 
					<ogc:Filter> 
						<ogc:PropertyIsEqualTo> 
							<ogc:PropertyName>type_code</ogc:PropertyName> 
							<ogc:Literal>district</ogc:Literal> 
						</ogc:PropertyIsEqualTo> 
					</ogc:Filter> 
					<TextSymbolizer> 
						<Geometry> 
							<ogc:Function name="centroid"> 
								<ogc:PropertyName>geom</ogc:PropertyName> 
							</ogc:Function> 
						</Geometry> 
						<Label> 
							 <ogc:PropertyName>name</ogc:PropertyName> 
						</Label> 
						<LabelPlacement> 
							<PointPlacement> 
								<AnchorPoint> 
									<AnchorPointX>0.5</AnchorPointX> 
									<AnchorPointY>0.5</AnchorPointY> 
								</AnchorPoint> 
							</PointPlacement> 
						</LabelPlacement> 
						<Halo> 
							<Radius>2</Radius> 
							<Fill> 
								<CssParameter name="fill">#FFFFFF</CssParameter> 
							</Fill> 
						</Halo> 
						<VendorOption name="conflictResolution">true</VendorOption> 
						<VendorOption name="goodnessOfFit">0</VendorOption> 
						<VendorOption name="autoWrap">60</VendorOption> 
					</TextSymbolizer> 
					<PolygonSymbolizer> 
						<Fill> 
							<CssParameter name="fill">#FFFFFF</CssParameter> 
							<CssParameter name="fill-opacity">0</CssParameter> 
						</Fill> 
						<Stroke> 
							<CssParameter name="stroke">#BA4A04</CssParameter> 
						</Stroke> 
					</PolygonSymbolizer> 
				</Rule> 
				<Rule> 
					<Name>rule2</Name> 
					<Title>Villages</Title> 
					<ogc:Filter> 
						<ogc:PropertyIsEqualTo> 
							<ogc:PropertyName>type_code</ogc:PropertyName> 
							<ogc:Literal>village</ogc:Literal> 
						</ogc:PropertyIsEqualTo> 
					</ogc:Filter> 
					<TextSymbolizer> 
						<Geometry> 
							<ogc:Function name="centroid"> 
								<ogc:PropertyName>geom</ogc:PropertyName> 
							</ogc:Function> 
						</Geometry> 
						<Label> 
							 <ogc:PropertyName>name</ogc:PropertyName> 
						</Label> 
						<LabelPlacement> 
							<PointPlacement> 
								<AnchorPoint> 
									<AnchorPointX>0.5</AnchorPointX> 
									<AnchorPointY>0.5</AnchorPointY> 
								</AnchorPoint> 
							</PointPlacement> 
						</LabelPlacement> 
						<Halo> 
							<Radius>2</Radius> 
							<Fill> 
								<CssParameter name="fill">#FFFFFF</CssParameter> 
							</Fill> 
						</Halo> 
						<VendorOption name="conflictResolution">true</VendorOption> 
						<VendorOption name="goodnessOfFit">0</VendorOption> 
						<VendorOption name="autoWrap">60</VendorOption> 
					</TextSymbolizer> 
					<PolygonSymbolizer> 
						<Fill> 
							<CssParameter name="fill">#FFFFFF</CssParameter> 
							<CssParameter name="fill-opacity">0</CssParameter> 
						</Fill> 
						<Stroke> 
							<CssParameter name="stroke">#8DBA04</CssParameter> 
						</Stroke> 
					</PolygonSymbolizer> 
				</Rule> 
			</FeatureTypeStyle> 
		</UserStyle> 
	</NamedLayer> 
</StyledLayerDescriptor>