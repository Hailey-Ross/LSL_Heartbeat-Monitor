//Script created by Hailey Enfield
//Please leave this comment intact<3

string heartbeatLink = "LINK-GOES-HERE.COM/stuff"; //Heartbeat Link
string scriptName = "Hails.Heartbeat-Mon";

pingHeartbeatMon()
{
    integer simPop = llGetRegionAgentCount();
    string simName = llGetRegionName();
    llHTTPRequest((string)heartbeatLink + "?msg=" + simName + " | FPS: " + (string)llGetRegionFPS() + ". Time Dilation: " + (string)llGetRegionTimeDilation() + ". Population: " + (string)simPop + ". ",[HTTP_METHOD,"GET"],"");
}

default {
    state_entry() {
        string simName = llGetRegionName();
        llInstantMessage(llGetOwner(), "" + (string)scriptName + " is now Online in the " + simName + " Region." );
        pingHeartbeatMon(); //initial ping.
        llSetTimerEvent(60.0); //How often to send a 'heartbeat'
    }
    
    timer() {
        pingHeartbeatMon();
    }
    
}
