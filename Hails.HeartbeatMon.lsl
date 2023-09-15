pingHeartbeatMon()
{
    integer simPop = llGetRegionAgentCount();
    string heartbeatLink = "LINK";
    string simName = llGetRegionName();
    llHTTPRequest((string)heartbeatLink + "?msg=" + simName + " | FPS: " + (string)llGetRegionFPS() + ". Time Dilation: " + (string)llGetRegionTimeDilation() + ". Population: " + (string)simPop + ". ",[HTTP_METHOD,"GET"],"");
}

default {
    state_entry() {
        pingHeartbeatMon();
        llSetTimerEvent(60.0);
    }
    
    timer() {
        pingHeartbeatMon();
    }
    
}