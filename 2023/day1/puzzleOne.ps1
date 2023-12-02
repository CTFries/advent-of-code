$input = Get-Content -Path "input.txt"
$array = $input.Split(' ')
$sum = 0
for ($i = 0; $i -lt $array.Length; $i++) {
  $string = $array[$i]
  $string -match '\d' > null
  $firstDigit = $matches[0]
  $string -match '.*(\d)' > null
  $lastDigit = $matches[1]
  $concatenatedDigits = $firstDigit + $lastDigit
  $integerValue = [int]$concatenatedDigits
  $sum += $integerValue
  Write-Host $string $firstDigit $lastDigit - $integerValue
}
Write-Host $sum