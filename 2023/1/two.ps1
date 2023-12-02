$input = Get-Content -Path "input.txt"
$array = $input.Split(' ')
$sum = 0
for ($i = 0; $i -lt $array.Length; $i++) {
  $string = $array[$i]
  $string -match '(\d|one|two|three|four|five|six|seven|eight|nine|zero)' > null
  $firstDigit = $matches[0]
  if ($firstDigit -is [string]) {
    switch ($firstDigit) {
      'one' { $firstDigit = 1 }
      'two' { $firstDigit = 2 }
      'three' { $firstDigit = 3 }
      'four' { $firstDigit = 4 }
      'five' { $firstDigit = 5 }
      'six' { $firstDigit = 6 }
      'seven' { $firstDigit = 7 }
      'eight' { $firstDigit = 8 }
      'nine' { $firstDigit = 9 }
      'zero' { $firstDigit = 0 }
    }
  }
  $string -match '.*(\d|one|two|three|four|five|six|seven|eight|nine|zero)' > null
  $lastDigit = $matches[1]
  if ($lastDigit -is [string]) {
    switch ($lastDigit) {
      'one' { $lastDigit = 1 }
      'two' { $lastDigit = 2 }
      'three' { $lastDigit = 3 }
      'four' { $lastDigit = 4 }
      'five' { $lastDigit = 5 }
      'six' { $lastDigit = 6 }
      'seven' { $lastDigit = 7 }
      'eight' { $lastDigit = 8 }
      'nine' { $lastDigit = 9 }
      'zero' { $lastDigit = 0 }
    }
  }
  $concatenatedDigits = [System.String]$firstDigit + [System.String]$lastDigit
  $integerValue = [int]$concatenatedDigits
  $sum += $integerValue
  Write-Host $string $firstDigit $lastDigit - $integerValue
}
Write-Host $sum