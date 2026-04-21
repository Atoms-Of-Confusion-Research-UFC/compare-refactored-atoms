$content = Get-Content 'bytecode-atoms.txt' -Raw

function Get-Instructions($method) {
  $pattern = $method + '\([^)]*\);[\s\S]*?Code:\s*([\s\S]*?)LineNumberTable'
  if ($content -match $pattern) {
    $code = $Matches[1]
    $lines = $code -split "`n" | Where-Object { $_ -match '^\s*\d+:' }
    $norm = @()
    foreach ($l in $lines) {
      $tmp = $l -replace '^\s*\d+:\s*',''
      $tmp = $tmp -replace '\s+\d+',''
      $norm += $tmp.Trim()
    }
    return ,$norm
  }
  return @()
}

function Levenshtein($a, $b) {
  $n = $a.Count
  $m = $b.Count

  $prev = @(0..$m)
  $curr = @(0) * ($m + 1)

  for ($i = 1; $i -le $n; $i++) {
    $curr[0] = $i
    for ($j = 1; $j -le $m; $j++) {
      if ($a[$i-1] -eq $b[$j-1]) { $cost = 0 } else { $cost = 1 }

      $insert = $curr[$j-1] + 1
      $delete = $prev[$j] + 1
      $replace = $prev[$j-1] + $cost

      $curr[$j] = [Math]::Min([Math]::Min($insert, $delete), $replace)
    }
    $prev = $curr.Clone()
  }

  return $prev[$m]
}


Write-Host "Levenshtein Distance Bytecode and its Normalization "
Write-Host " "

$m1 = Get-Instructions 'conditionalOperatorConfusing'
$m2 = Get-Instructions 'conditionalOperatorRefactored'

if ($m1.Count -eq 0 -or $m2.Count -eq 0) {
  Write-Host 'ERRO: Metodo nao encontrado'
} else {
  $size1 = $m1.Count
  $size2 = $m2.Count

  $dist = Levenshtein $m1 $m2
  $max = [Math]::Max($size1, $size2)
  $norm = if ($max -gt 0) { [Math]::Round($dist / $max, 3) } else { 0 }

  Write-Host "Conditional Operator:"
  Write-Host "  Confusing  -> instructions = $size1"
  Write-Host "  Refactored -> instructions = $size2"
  Write-Host "  Levenshtein Distance  = $dist"
  Write-Host "  Normalized= $norm"
}

$m1 = Get-Instructions 'preIncrementConfusing'
$m2 = Get-Instructions 'preIncrementRefactored'

if ($m1.Count -eq 0 -or $m2.Count -eq 0) {
  Write-Host 'ERRO: Metodo nao encontrado'
} else {
  $size1 = $m1.Count
  $size2 = $m2.Count
  $dist = Levenshtein $m1 $m2
  $max = [Math]::Max($m1.Count,$m2.Count)
  $norm = if ($max -gt 0) { [Math]::Round($dist / $max,3) } else { 0 }
  Write-Host "Pre-Increment"
  Write-Host "  Confusing  -> instructions = $size1"
  Write-Host "  Refactored -> instructions = $size2"
  Write-Host "  Levenshtein Distance  = $dist"
  Write-Host "  Normalized= $norm"
}

$m1 = Get-Instructions 'postIncrementConfusing'
$m2 = Get-Instructions 'postIncrementRefactored'

if ($m1.Count -eq 0 -or $m2.Count -eq 0) {
  Write-Host 'ERRO: Metodo nao encontrado'
} else {
  $size1 = $m1.Count
  $size2 = $m2.Count
  $dist = Levenshtein $m1 $m2
  $max = [Math]::Max($m1.Count,$m2.Count)
  $norm = if ($max -gt 0) { [Math]::Round($dist / $max,3) } else { 0 }
  Write-Host "Pos-Increment"
  Write-Host "  Confusing  -> instructions = $size1"
  Write-Host "  Refactored -> instructions = $size2"
  Write-Host "  Levenshtein Distance  = $dist"
  Write-Host "  Normalized= $norm"
}

$m1 = Get-Instructions 'logicAsControlFlowConfusing'
$m2 = Get-Instructions 'logicAsControlFlowRefactored'

if ($m1.Count -eq 0 -or $m2.Count -eq 0) {
  Write-Host 'ERRO: Metodo nao encontrado'
} else {
  $size1 = $m1.Count
  $size2 = $m2.Count
  $dist = Levenshtein $m1 $m2
  $max = [Math]::Max($m1.Count,$m2.Count)
  $norm = if ($max -gt 0) { [Math]::Round($dist / $max,3) } else { 0 }
  Write-Host "Logic As Control Flow"
  Write-Host "  Confusing  -> instructions = $size1"
  Write-Host "  Refactored -> instructions = $size2"
  Write-Host "  Levenshtein Distance  = $dist"
  Write-Host "  Normalized= $norm"
}

$m1 = Get-Instructions 'ommitedCurlyBracesConfusing'
$m2 = Get-Instructions 'ommitedCurlyBracesRefactored'

if ($m1.Count -eq 0 -or $m2.Count -eq 0) {
  Write-Host 'ERRO: Metodo nao encontrado'
} else {
  $size1 = $m1.Count
  $size2 = $m2.Count
  $dist = Levenshtein $m1 $m2
  $max = [Math]::Max($m1.Count,$m2.Count)
  $norm = if ($max -gt 0) { [Math]::Round($dist / $max,3) } else { 0 }
  Write-Host "Ommited Curly Braces"
  Write-Host "  Confusing  -> instructions = $size1"
  Write-Host "  Refactored -> instructions = $size2"
  Write-Host "  Levenshtein Distance  = $dist"
  Write-Host "  Normalized= $norm"

}


$m1 = Get-Instructions 'typeConversionConfusing'
$m2 = Get-Instructions 'typeConversionRefactored'

if ($m1.Count -eq 0 -or $m2.Count -eq 0) {
  Write-Host 'ERRO: Metodo nao encontrado'
} else {
  $size1 = $m1.Count
  $size2 = $m2.Count
  $dist = Levenshtein $m1 $m2
  $max = [Math]::Max($m1.Count,$m2.Count)
  $norm = if ($max -gt 0) { [Math]::Round($dist / $max,3) } else { 0 }
  Write-Host "Type Conversion"
  Write-Host "  Confusing  -> instructions = $size1"
  Write-Host "  Refactored -> instructions = $size2"
  Write-Host "  Levenshtein Distance  = $dist"
  Write-Host "  Normalized= $norm" 
}
     
$m1 = Get-Instructions 'infixOperatorPrecedenceConfusing'
$m2 = Get-Instructions 'infixOperatorPrecedenceRefactored'

if ($m1.Count -eq 0 -or $m2.Count -eq 0) {
  Write-Host 'ERRO: Metodo nao encontrado'
} else {
  $size1 = $m1.Count
  $size2 = $m2.Count
  $dist = Levenshtein $m1 $m2
  $max = [Math]::Max($m1.Count,$m2.Count)
  $norm = if ($max -gt 0) { [Math]::Round($dist / $max,3) } else { 0 }
  Write-Host "Infix Operator Precedence:"
  Write-Host "  Confusing  -> instructions = $size1"
  Write-Host "  Refactored -> instructions = $size2"
  Write-Host "  Levenshtein Distance  = $dist"
  Write-Host "  Normalized= $norm"   
}

     
$m1 = Get-Instructions 'arithmeticAsLogicConfusing'
$m2 = Get-Instructions 'arithmeticAsLogicRefactored'

if ($m1.Count -eq 0 -or $m2.Count -eq 0) {
  Write-Host 'ERRO: Metodo nao encontrado'
} else {
  $size1 = $m1.Count
  $size2 = $m2.Count
  $dist = Levenshtein $m1 $m2
  $max = [Math]::Max($m1.Count,$m2.Count)
  $norm = if ($max -gt 0) { [Math]::Round($dist / $max,3) } else { 0 }
  Write-Host "Arithmetic as Logic:"
  Write-Host "  Confusing  -> instructions = $size1"
  Write-Host "  Refactored -> instructions = $size2"
  Write-Host "  Levenshtein Distance  = $dist"
  Write-Host "  Normalized= $norm"   
}
