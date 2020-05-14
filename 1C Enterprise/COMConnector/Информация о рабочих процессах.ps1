[Console]::OutputEncoding = [System.Text.Encoding]::GetEncoding("utf-8");

$agentPort = 1540;
$agentAddress = "localhost";
$clusterAdminName = "";
$clusterAdminPassword = "";
$fullAgentAddress = "tcp://" + $agentAddress + ":" + $agentPort;

$v83COMConnector = $null;
try {
    $v83COMConnector = New-Object -COMObject "V83.COMConnector"
} 
catch {
    Write-Host "Компонента "V83.COMConnector" не зарегистрирована.";
}

if($null -eq $v83COMConnector) {
    return;
}

$serverAgent = $v83COMConnector.ConnectAgent($SrvAddr);
$clusterList = $ServerAgent.GetClusters();

foreach ($cluster in $clusterList) {
    $serverAgent.Authenticate($Cluster, $clusterAdminName, $clusterAdminPassword)        
    $workingProcesses = $serverAgent.GetWorkingProcesses($cluster)

    foreach ($workProcess in $workingProcesses) {
        $workProcess
    }
}