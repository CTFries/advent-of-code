$input = Get-Content -Path "input.txt"
$array = $input.Split('\n')
$impossibleGameSum = 0
function CreateRoundObject($roundString) {
    $roundObject = @{'g' = 0; 'b' = 0; 'r' = 0}
    $roundParts = $roundString -split ', '
    foreach ($part in $roundParts) {
        $details = $part -split ' '
        switch ($details[1]) {
            "green" { $roundObject['g'] = [int]$details[0] }
            "blue" { $roundObject['b'] = [int]$details[0] }
            "red" { $roundObject['r'] = [int]$details[0] }
        }
    }
    return $roundObject
}
for ($i = 0; $i -lt $array.Length; $i++) {
    $gameDetails = $array[$i] -split ': '
    $gameNumber = $gameDetails[0] -replace 'Game ', ''
    $rounds = $gameDetails[1] -split '; '
    $roundsArray = @()
    foreach ($round in $rounds) {
        $roundObject = CreateRoundObject($round)
        $roundsArray += $roundObject
    }
    $gameObject = @{'game' = $gameNumber; 'rounds' = $roundsArray}
    $array[$i] = $gameObject
}
for ($i = 0; $i -lt $array.Length; $i++) {
    $game = $array[$i]
    $gameJson = $game | ConvertTo-Json -Depth 6
    $gameNumber = $game['game']
    $rounds = $game['rounds']
    $impossibleGame = $false
    foreach ($round in $rounds) {
        if ($round['g'] -gt 13) {
            $impossibleGame = $true
        } 
        if ($round['b'] -gt 14) {
            $impossibleGame = $true
        } 
        if ($round['r'] -gt 12) {
            $impossibleGame = $true
        }
    }
    if (!$impossibleGame)   {
        $impossibleGameSum += $gameNumber
    }
}
Write-Host $impossibleGameSum




