<?xml version="1.0" encoding="utf-8"?><!-- Copyright © Goya Pty Ltd 2006-2012, All Rights Reserved --><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.filemaker.com/fmpxmlresult">		<xsl:output method="xml" encoding="UTF-8" />	<xsl:template match="/">		<FMPXMLRESULT xmlns="http://www.filemaker.com/fmpxmlresult">			<METADATA>				<FIELD EMPTYOK="YES" MAXREPEAT="1" NAME="Analysis ID" TYPE="TEXT" />				<FIELD EMPTYOK="YES" MAXREPEAT="1" NAME="File ID" TYPE="TEXT" />				<FIELD EMPTYOK="YES" MAXREPEAT="1" NAME="File Name" TYPE="TEXT" />				<FIELD EMPTYOK="YES" MAXREPEAT="1" NAME="Layout id" TYPE="TEXT" />				<FIELD EMPTYOK="YES" MAXREPEAT="1" NAME="CustomFunction id" TYPE="TEXT" />				<FIELD EMPTYOK="YES" MAXREPEAT="1" NAME="Menu id" TYPE="TEXT" />				<FIELD EMPTYOK="YES" MAXREPEAT="1" NAME="Table id" TYPE="TEXT" />				<FIELD EMPTYOK="YES" MAXREPEAT="1" NAME="Field id" TYPE="TEXT" />				<FIELD EMPTYOK="YES" MAXREPEAT="1" NAME="FileReference id" TYPE="TEXT" />				<FIELD EMPTYOK="YES" MAXREPEAT="1" NAME="PrivilegeSet id" TYPE="TEXT" />				<FIELD EMPTYOK="YES" MAXREPEAT="1" NAME="Type" TYPE="TEXT" />				<FIELD EMPTYOK="YES" MAXREPEAT="1" NAME="Calculation" TYPE="TEXT" />			</METADATA>			<RESULTSET>						<xsl:for-each select="/FMPReport/File">					<xsl:for-each select="BaseTableCatalog/BaseTable">						<xsl:variable name="BaseTableid" select="@id" />						<xsl:variable name="BaseTableName" select="@name" />						<xsl:for-each select="FieldCatalog/Field">							<xsl:variable name="Fieldid" select="@id" />							<xsl:variable name="FieldName" select="@name" />							<xsl:for-each select="self::node()[@fieldType='Calculated']/Calculation[.!='']">								<xsl:call-template name="Calc_RESULTSET">									<xsl:with-param name="AnalysisID" select="$AnalysisID"/>									<xsl:with-param name="FileID" select="$FileID"/>									<xsl:with-param name="FileName" select="$FileName"/>									<xsl:with-param name="BaseTableid" select="$BaseTableid"/>									<xsl:with-param name="Fieldid" select="$Fieldid"/>									<xsl:with-param name="Calculation" select="."/>								</xsl:call-template>							</xsl:for-each>							<xsl:for-each select="self::node()[@dataType='Binary']/Storage/Remote[@type='Open']/Location/Calculation[.!='']">								<xsl:call-template name="Calc_RESULTSET">									<xsl:with-param name="AnalysisID" select="$AnalysisID"/>									<xsl:with-param name="FileID" select="$FileID"/>									<xsl:with-param name="FileName" select="$FileName"/>									<xsl:with-param name="BaseTableid" select="$BaseTableid"/>									<xsl:with-param name="Fieldid" select="$Fieldid"/>									<xsl:with-param name="Type" select="'Storage Location'"/>									<xsl:with-param name="Calculation" select="."/>								</xsl:call-template>							</xsl:for-each>							<xsl:for-each select="self::node()[@fieldType='Normal']">								<xsl:for-each select="AutoEnter[@calculation='True']/Calculation[.!='']">									<xsl:call-template name="Calc_RESULTSET">										<xsl:with-param name="AnalysisID" select="$AnalysisID"/>										<xsl:with-param name="FileID" select="$FileID"/>										<xsl:with-param name="FileName" select="$FileName"/>										<xsl:with-param name="BaseTableid" select="$BaseTableid"/>										<xsl:with-param name="Fieldid" select="$Fieldid"/>										<xsl:with-param name="Type" select="'AutoEnter'"/>										<xsl:with-param name="Calculation" select="."/>									</xsl:call-template>								</xsl:for-each>								<xsl:for-each select="Validation[@calculation='True']/Calculation[.!='']">									<xsl:call-template name="Calc_RESULTSET">										<xsl:with-param name="AnalysisID" select="$AnalysisID"/>										<xsl:with-param name="FileID" select="$FileID"/>										<xsl:with-param name="FileName" select="$FileName"/>										<xsl:with-param name="BaseTableid" select="$BaseTableid"/>										<xsl:with-param name="Fieldid" select="$Fieldid"/>										<xsl:with-param name="Type" select="'Validation'"/>										<xsl:with-param name="Calculation" select="."/>									</xsl:call-template>								</xsl:for-each>							</xsl:for-each>						</xsl:for-each>					</xsl:for-each>					<xsl:for-each select="CustomFunctionCatalog/CustomFunction">						<xsl:variable name="CustomFunctionid" select="@id" />						<xsl:variable name="CustomFunctionName" select="@name" />						<xsl:for-each select="Calculation[.!='']">							<xsl:call-template name="Calc_RESULTSET">								<xsl:with-param name="AnalysisID" select="$AnalysisID"/>								<xsl:with-param name="FileID" select="$FileID"/>								<xsl:with-param name="FileName" select="$FileName"/>								<xsl:with-param name="CustomFunctionid" select="$CustomFunctionid"/>								<xsl:with-param name="Type" select="'Validation'"/>								<xsl:with-param name="Calculation" select="."/>							</xsl:call-template>						</xsl:for-each>					</xsl:for-each>					<xsl:for-each select="CustomMenuCatalog/CustomMenu">						<xsl:variable name="Menuid" select="@id"/>						<xsl:variable name="MenuName" select="@name"/>						<xsl:for-each select="self::node()[Options/@overrideName='True']/Title/Calculation[.!='']">							<xsl:call-template name="Calc_RESULTSET">								<xsl:with-param name="AnalysisID" select="$AnalysisID"/>								<xsl:with-param name="FileID" select="$FileID"/>								<xsl:with-param name="FileName" select="$FileName"/>								<xsl:with-param name="CustomMenuid" select="$Menuid"/>								<xsl:with-param name="Type" select="'Menu Title'"/>								<xsl:with-param name="Calculation" select="."/>							</xsl:call-template>						</xsl:for-each>												<xsl:for-each select="Conditions/*">							<xsl:for-each select="Calculation[.!='']">								<xsl:call-template name="Calc_RESULTSET">									<xsl:with-param name="AnalysisID" select="$AnalysisID"/>									<xsl:with-param name="FileID" select="$FileID"/>									<xsl:with-param name="FileName" select="$FileName"/>									<xsl:with-param name="CustomMenuid" select="$Menuid"/>									<xsl:with-param name="Type" select="concat('Menu ',name(..),' Condition')"/>									<xsl:with-param name="Calculation" select="."/>									</xsl:call-template>							</xsl:for-each>						</xsl:for-each>						<xsl:for-each select="MenuItemList/MenuItem">							<xsl:variable name="MenuItemName" select="Command/@name"/>							<xsl:for-each select="self::node()[@isSeparatorItem!='True']">								<xsl:for-each select="Name/Calculation[.!='']">									<xsl:call-template name="Calc_RESULTSET">										<xsl:with-param name="AnalysisID" select="$AnalysisID"/>										<xsl:with-param name="FileID" select="$FileID"/>										<xsl:with-param name="FileName" select="$FileName"/>										<xsl:with-param name="CustomMenuid" select="$Menuid"/>										<xsl:with-param name="Type" select="'Item Name'"/>										<xsl:with-param name="Calculation" select="."/>									</xsl:call-template>								</xsl:for-each>								<xsl:for-each select="Conditions/*">									<xsl:variable name="pos" select="position()"/>									<xsl:for-each select="Calculation[.!='']">										<xsl:call-template name="Calc_RESULTSET">											<xsl:with-param name="AnalysisID" select="$AnalysisID"/>											<xsl:with-param name="FileID" select="$FileID"/>											<xsl:with-param name="FileName" select="$FileName"/>											<xsl:with-param name="CustomMenuid" select="$Menuid"/>											<xsl:with-param name="Type" select="concat('Item ',name(..),' Condition')"/>											<xsl:with-param name="Calculation" select="."/>											</xsl:call-template>									</xsl:for-each>								</xsl:for-each>								<xsl:for-each select="Step">									<xsl:for-each select="descendant::Calculation[.!='']">										<xsl:call-template name="Calc_RESULTSET">											<xsl:with-param name="AnalysisID" select="$AnalysisID"/>											<xsl:with-param name="FileID" select="$FileID"/>											<xsl:with-param name="FileName" select="$FileName"/>											<xsl:with-param name="CustomMenuid" select="$CustomMenuid"/>											<xsl:with-param name="Type" select="concat($Type,name(..))"/>											<xsl:with-param name="Calculation" select="."/>										</xsl:call-template>									</xsl:for-each>								</xsl:for-each>							</xsl:for-each>						</xsl:for-each>					</xsl:for-each>					<xsl:for-each select="FileReferenceCatalog/OdbcDataSource|ExternalDataSourcesCatalog/OdbcDataSource">						<xsl:variable name="FileReferenceid" select="@id"/>						<xsl:for-each select="Username|Password">							<xsl:for-each select="Calculation[.!='']">								<xsl:call-template name="Calc_RESULTSET">									<xsl:with-param name="AnalysisID" select="$AnalysisID"/>									<xsl:with-param name="FileID" select="$FileID"/>									<xsl:with-param name="FileName" select="$FileName"/>									<xsl:with-param name="FileReferenceid" select="$FileReferenceid"/>									<xsl:with-param name="Type" select="name(..)"/>									<xsl:with-param name="Calculation" select="."/>									</xsl:call-template>							</xsl:for-each>						</xsl:for-each>					</xsl:for-each>					<xsl:for-each select="LayoutCatalog">						<xsl:for-each select="Layout|descendant::Group/Layout">							<xsl:variable name="Layoutid" select="@id"/>							<xsl:variable name="LayoutName" select="@name"/>							<xsl:for-each select="ScriptTriggers">								<xsl:for-each select="Trigger">									<xsl:for-each select="Script/Calculation[.!='']">										<xsl:call-template name="Calc_RESULTSET">											<xsl:with-param name="AnalysisID" select="$AnalysisID"/>											<xsl:with-param name="FileID" select="$FileID"/>											<xsl:with-param name="FileName" select="$FileName"/>											<xsl:with-param name="Layoutid" select="$Layoutid"/>											<xsl:with-param name="Type" select="'LayoutTrigger'"/>											<xsl:with-param name="Calculation" select="."/>											</xsl:call-template>									</xsl:for-each>								</xsl:for-each>							</xsl:for-each>							<xsl:for-each select="descendant::Object">								<xsl:variable name="ObjectType" select="@type"/>																<xsl:for-each select="ButtonBarObj/ActiveSegmentCalc/Calculation[.!='']">									<xsl:call-template name="Calc_RESULTSET">										<xsl:with-param name="AnalysisID" select="$AnalysisID"/>										<xsl:with-param name="FileID" select="$FileID"/>										<xsl:with-param name="FileName" select="$FileName"/>										<xsl:with-param name="Layoutid" select="$Layoutid"/>										<xsl:with-param name="Type" select="'ActiveSegmentCalc'"/>										<xsl:with-param name="Calculation" select="."/>									</xsl:call-template>								</xsl:for-each>																<xsl:for-each select="ConditionalFormatting/Item/Condition[@op='0']/Calculation">																		<xsl:call-template name="Calc_RESULTSET">										<xsl:with-param name="AnalysisID" select="$AnalysisID"/>										<xsl:with-param name="FileID" select="$FileID"/>										<xsl:with-param name="FileName" select="$FileName"/>										<xsl:with-param name="Layoutid" select="$Layoutid"/>										<xsl:with-param name="Type" select="'ConditionalFormatting'"/>										<xsl:with-param name="Calculation" select="."/>									</xsl:call-template>								</xsl:for-each>								<xsl:for-each select="HideCondition/Calculation[.!='']">									<xsl:call-template name="Calc_RESULTSET">										<xsl:with-param name="AnalysisID" select="$AnalysisID"/>										<xsl:with-param name="FileID" select="$FileID"/>										<xsl:with-param name="FileName" select="$FileName"/>										<xsl:with-param name="Layoutid" select="$Layoutid"/>										<xsl:with-param name="Type" select="'HideCondition'"/>										<xsl:with-param name="Calculation" select="."/>									</xsl:call-template>								</xsl:for-each>								<xsl:for-each select="ExternalObj">									<xsl:for-each select="descendant::Calculation[.!='']">										<xsl:call-template name="Calc_RESULTSET">											<xsl:with-param name="AnalysisID" select="$AnalysisID"/>											<xsl:with-param name="FileID" select="$FileID"/>											<xsl:with-param name="FileName" select="$FileName"/>											<xsl:with-param name="Layoutid" select="$Layoutid"/>											<xsl:with-param name="Type" select="'ExternalObject'"/>											<xsl:with-param name="Calculation" select="."/>											</xsl:call-template>									</xsl:for-each>								</xsl:for-each>								<xsl:for-each select="(GroupButtonObj|ButtonObj)/Step">									<xsl:for-each select="descendant::Calculation[.!='']">										<xsl:call-template name="Calc_RESULTSET">											<xsl:with-param name="AnalysisID" select="$AnalysisID"/>											<xsl:with-param name="FileID" select="$FileID"/>											<xsl:with-param name="FileName" select="$FileName"/>											<xsl:with-param name="Layoutid" select="$Layoutid"/>											<xsl:with-param name="Type" select="concat($Type,name(..))"/>											<xsl:with-param name="Calculation" select="."/>										</xsl:call-template>									</xsl:for-each>								</xsl:for-each>								<xsl:for-each select="PortalObj">									<xsl:for-each select="FilterCalc[@enable='True']/Calculation[.!='']">										<xsl:call-template name="Calc_RESULTSET">											<xsl:with-param name="AnalysisID" select="$AnalysisID"/>											<xsl:with-param name="FileID" select="$FileID"/>											<xsl:with-param name="FileName" select="$FileName"/>											<xsl:with-param name="Layoutid" select="$Layoutid"/>											<xsl:with-param name="Type" select="'PortalFilter'"/>											<xsl:with-param name="Calculation" select="."/>											</xsl:call-template>									</xsl:for-each>								</xsl:for-each>								<xsl:for-each select="ScriptTriggers">									<xsl:for-each select="Trigger">										<xsl:for-each select="Script/Calculation[.!='']">											<xsl:call-template name="Calc_RESULTSET">												<xsl:with-param name="AnalysisID" select="$AnalysisID"/>												<xsl:with-param name="FileID" select="$FileID"/>												<xsl:with-param name="FileName" select="$FileName"/>												<xsl:with-param name="Layoutid" select="$Layoutid"/>												<xsl:with-param name="Type" select="'ObjectTrigger'"/>												<xsl:with-param name="Calculation" select="."/>											</xsl:call-template>										</xsl:for-each>									</xsl:for-each>								</xsl:for-each>								<xsl:for-each select="TabControlObj/PanelCalc/Calculation[.!='']">									<xsl:call-template name="Calc_RESULTSET">										<xsl:with-param name="AnalysisID" select="$AnalysisID"/>										<xsl:with-param name="FileID" select="$FileID"/>										<xsl:with-param name="FileName" select="$FileName"/>										<xsl:with-param name="Layoutid" select="$Layoutid"/>										<xsl:with-param name="Type" select="'TabControlPanelCalc'"/>										<xsl:with-param name="Calculation" select="."/>									</xsl:call-template>								</xsl:for-each>																<xsl:for-each select="TitleCalc/Calculation[.!='']">									<xsl:call-template name="Calc_RESULTSET">										<xsl:with-param name="AnalysisID" select="$AnalysisID"/>										<xsl:with-param name="FileID" select="$FileID"/>										<xsl:with-param name="FileName" select="$FileName"/>										<xsl:with-param name="Layoutid" select="$Layoutid"/>										<xsl:with-param name="Type" select="'Title'"/>										<xsl:with-param name="Calculation" select="."/>									</xsl:call-template>								</xsl:for-each>								<xsl:for-each select="ToolTip/Calculation[.!='']">									<xsl:call-template name="Calc_RESULTSET">										<xsl:with-param name="AnalysisID" select="$AnalysisID"/>										<xsl:with-param name="FileID" select="$FileID"/>										<xsl:with-param name="FileName" select="$FileName"/>										<xsl:with-param name="Layoutid" select="$Layoutid"/>										<xsl:with-param name="Type" select="'ToolTip'"/>										<xsl:with-param name="Calculation" select="."/>									</xsl:call-template>								</xsl:for-each>								<xsl:for-each select="LabelCalc/Calculation[.!='']">									<xsl:call-template name="Calc_RESULTSET">										<xsl:with-param name="AnalysisID" select="$AnalysisID"/>										<xsl:with-param name="FileID" select="$FileID"/>										<xsl:with-param name="FileName" select="$FileName"/>										<xsl:with-param name="Layoutid" select="$Layoutid"/>										<xsl:with-param name="Type" select="'LabelCalc'"/>										<xsl:with-param name="Calculation" select="."/>									</xsl:call-template>								</xsl:for-each>																<xsl:for-each select="FieldObj/PlaceholderText/Calculation[.!='']">									<xsl:call-template name="Calc_RESULTSET">										<xsl:with-param name="AnalysisID" select="$AnalysisID"/>										<xsl:with-param name="FileID" select="$FileID"/>										<xsl:with-param name="FileName" select="$FileName"/>										<xsl:with-param name="Layoutid" select="$Layoutid"/>										<xsl:with-param name="Type" select="'PlaceholderText'"/>										<xsl:with-param name="Calculation" select="."/>									</xsl:call-template>								</xsl:for-each>															</xsl:for-each>						</xsl:for-each>					</xsl:for-each>					<xsl:for-each select="PrivilegesCatalog/PrivilegeSet">						<xsl:variable name="PrivilegeSetid" select="@id"/>						<xsl:for-each select="Records[@value='Custom']/TableList/BaseTable">							<xsl:variable name="BaseTableid" select="@id"/>							<xsl:for-each select="View[@value='Limited']|Edit[@value='Limited']|Delete[@value='Limited']">								<xsl:for-each select="Calculation[.!='']">									<xsl:call-template name="Calc_RESULTSET">										<xsl:with-param name="AnalysisID" select="$AnalysisID"/>										<xsl:with-param name="FileID" select="$FileID"/>										<xsl:with-param name="FileName" select="$FileName"/>										<xsl:with-param name="BaseTableid" select="$BaseTableid"/>										<xsl:with-param name="PrivilegeSetid" select="$PrivilegeSetid"/>										<xsl:with-param name="Type" select="name(..)"/>										<xsl:with-param name="Calculation" select="."/>									</xsl:call-template>								</xsl:for-each>							</xsl:for-each>						</xsl:for-each>					</xsl:for-each>					<xsl:for-each select="ScriptCatalog">						<xsl:for-each select="Script|descendant::Group|descendant::Group/Script">							<xsl:variable name="Scriptid" select="@id"/>							<xsl:for-each select="StepList">								<xsl:for-each select="Step">									<xsl:for-each select="descendant::Calculation[.!='']">										<xsl:call-template name="Calc_RESULTSET">											<xsl:with-param name="AnalysisID" select="$AnalysisID"/>											<xsl:with-param name="FileID" select="$FileID"/>											<xsl:with-param name="FileName" select="$FileName"/>											<xsl:with-param name="Stepid" select="$Stepid"/>											<xsl:with-param name="Type" select="concat($Type,name(..))"/>											<xsl:with-param name="Calculation" select="."/>										</xsl:call-template>									</xsl:for-each>								</xsl:for-each>							</xsl:for-each>						</xsl:for-each>					</xsl:for-each>				</xsl:for-each>			</xsl:for-each>		</RESULTSET>	</FMPXMLRESULT></xsl:template><xsl:template name="Calc_RESULTSET">	<xsl:param name="AnalysisID" />	<xsl:param name="FileID" />	<xsl:param name="FileName" />	<xsl:param name="BaseTableid" />	<xsl:param name="Fieldid" />	<xsl:param name="CustomFunctionid" />	<xsl:param name="CustomMenuid" />	<xsl:param name="Layoutid" />	<xsl:param name="FileReferenceid" />	<xsl:param name="PrivilegeSetid" />	<xsl:param name="Type" />	<xsl:param name="Calculation" />	<ROW>		<COL><DATA><xsl:value-of select="$AnalysisID"/></DATA></COL>		<COL><DATA><xsl:value-of select="$FileID"/></DATA></COL>		<COL><DATA><xsl:value-of select="$FileName"/></DATA></COL>		<COL><DATA><xsl:value-of select="$Layoutid"/></DATA></COL>		<COL><DATA><xsl:value-of select="$CustomFunctionid"/></DATA></COL>		<COL><DATA><xsl:value-of select="$CustomMenuid"/></DATA></COL>		<COL><DATA><xsl:value-of select="$BaseTableid"/></DATA></COL>		<COL><DATA><xsl:value-of select="$Fieldid"/></DATA></COL>		<COL><DATA><xsl:value-of select="$FileReferenceid"/></DATA></COL>		<COL><DATA><xsl:value-of select="$PrivilegeSetid"/></DATA></COL>		<COL><DATA><xsl:value-of select="$Type" /></DATA></COL>		<COL><DATA><xsl:value-of select="$Calculation" /></DATA></COL>	</ROW></xsl:template></xsl:stylesheet>