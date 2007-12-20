<!--------------------------------------------------------------------
Generated Application: TransferSample
Generated Date: March 19 2007
Generated By: ColdBox Ant Task.
---------------------------------------------------------------------->
<!-----------------------------------------------------------------------
Template : ehGeneral.cfc
Author 	 : Luis Majano
Date     : 3/19/2007 3:28:35 PM
Description :
	This is the main handler for the Transfer sample

Modification History:
3/19/2007 - Created Template
----------------------------------------------------------------------><cfcomponent name="ehGeneral" extends="coldbox.system.eventhandler">	<cffunction name="onAppInit" access="public" returntype="void" output="false">		<cfargument name="Event" type="coldbox.system.beans.requestContext">		<!--- ON Application Start Here --->
		<!--- Create our Transfer Factory --->
		<cfset var DSFile = getSetting("TransferSettings").datasourceFile>
		<cfset var TFile = getSetting("TransferSettings").transferFile>
		<cfset var Definitions = "/" & getSetting("AppMapping") & "/" & getSetting("TransferSettings").Definitions>
		<cfset var TransferFactory = CreateObject("component","transfer.TransferFactory").init(DSFile,TFile,Definitions)>		<!--- Place in Cache Indefinetely --->
		<cfset getColdBoxOCM().set("TransferFactory",TransferFactory, 0)>
	</cffunction>	<cffunction name="onRequestStart" access="public" returntype="void" output="false">		<cfargument name="Event" type="coldbox.system.beans.requestContext">		<!--- On Request Start Code Here --->
		<cfset var rc = event.getCollection()>
		<!--- Set a title for my App--->
		<cfset rc.title = "Transfer Sample Application">
		<!--- Place the Transfer Factory in the event object for every Request --->
		<cfset rc.Transfer = getColdboxOCM().get("TransferFactory").getTransfer()>	</cffunction></cfcomponent>