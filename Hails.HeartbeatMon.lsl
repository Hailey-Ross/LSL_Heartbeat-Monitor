pingHeartbeatMon()
{
    integer simPop = llGetRegionAgentCount();
    string heartbeatLink = "LINK"; //Add 'Heartbeat' URL from sites like Cronitor.io or Uptime Kuma
    string scriptName = "SCRIPT NAME HERE"; //Custom name to use on startup OR use llGetScriptName();
    string simName = llGetRegionName();
    llHTTPRequest((string)heartbeatLink + "?msg=" + simName + " | FPS: " + (string)llGetRegionFPS() + ". Time Dilation: " + (string)llGetRegionTimeDilation() + ". Population: " + (string)simPop + ". ",[HTTP_METHOD,"GET"],"");
}

default {
    state_entry() {
        llInstantMessage(llGetOwner(), llGetScriptName() + " is now Online in the " + llGetRegionName() + " Region." );
        pingHeartbeatMon(); //initial ping.
        llSetTimerEvent(60.0); //How often to send a 'heartbeat'
    }
    
    timer() {
        pingHeartbeatMon();
    }
    
}
