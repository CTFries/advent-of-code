$input = Get-Content -Path "input.txt"
$array = $input.Split('\n')
$allGamesPowerSum = 0
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
    $rounds = $game['rounds']
    $minRed = 0
    $minBlue = 0
    $minGreen = 0
    foreach ($round in $rounds) {
        if ($round['g'] -gt $minGreen) {
            $minGreen = $round['g']
        }
        if ($round['b'] -gt $minBlue) {
            $minBlue = $round['b']
        }
        if ($round['r'] -gt $minRed) {
            $minRed = $round['r']
        }
    }
    $gamePower = $minGreen * $minBlue * $minRed
    $allGamesPowerSum += $gamePower
}
Write-Host $allGamesPowerSum




