<cfcomponent displayname="Check if valid RSS feed" hint="I take a URL and check it against ATOM to see if it is valid">
   <cffunction name="isValidRss" access="public" returntype="string" displayname="isValidRss" hint="I check an RSS Feed to see if its valid">
      
      <cfset var validationResult = FALSE>
      
      <cfargument name="rssUrl" type="string" required="true">
      
      <!--- Go of and validate the feed --->
      <cfhttp
         method="get"
         url="http://feedvalidator.org/check?url=#rssUrl#"
         resolveurl="yes"
         throwonerror="yes">
   
      <cfif findNoCase("Congratulations!", cfhttp.FileContent)>
         <cfset validationResult = TRUE>
      </cfif>
   
      <cfreturn validationResult>
   </cffunction>
</cfcomponent>