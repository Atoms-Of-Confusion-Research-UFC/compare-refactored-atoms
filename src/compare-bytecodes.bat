@echo off

echo ======================================== > bytecode-atoms.txt
echo   COMPARADOR DE BYTECODE >> bytecode-atoms.txt
echo   Classe: AtomsOfConfusion >> bytecode-atoms.txt
echo ======================================== >> bytecode-atoms.txt
echo. >> bytecode-atoms.txt

echo ========================================
echo   COMPARADOR DE BYTECODE
echo   Classe: AtomsOfConfusion
echo ========================================
echo.

echo Compilando AtomsOfConfusion.java...
echo Compilando AtomsOfConfusion.java... >> bytecode-atoms.txt
javac AtomsOfConfusion.java

if %ERRORLEVEL% NEQ 0 (
    echo ERRO: Falha na compilacao!
    echo ERRO: Falha na compilacao! >> bytecode-atoms.txt
    pause
    exit /b 1
)
echo OK!
echo OK! >> bytecode-atoms.txt
echo.
echo. >> bytecode-atoms.txt

echo ========================================
echo   SALVANDO BYTECODE VERBOSE
echo ========================================
echo ======================================== >> bytecode-atoms.txt
echo   SALVANDO BYTECODE VERBOSE >> bytecode-atoms.txt
echo ======================================== >> bytecode-atoms.txt
javap -v AtomsOfConfusion > bytecode-atoms.txt
echo Arquivo salvo: bytecode-atoms.txt
echo Arquivo salvo: bytecode-atoms.txt >> bytecode-atoms.txt
echo.
echo. >> bytecode-atoms.txt

echo ========================================
echo   TAMANHO DO ARQUIVO .class
echo ========================================
echo ======================================== >> bytecode-atoms.txt
echo   TAMANHO DO ARQUIVO .class >> bytecode-atoms.txt
echo ======================================== >> bytecode-atoms.txt
for %%F in (AtomsOfConfusion.class) do (
    echo AtomsOfConfusion.class: %%~zF bytes
    echo AtomsOfConfusion.class: %%~zF bytes >> bytecode-atoms.txt
)
echo.
echo. >> bytecode-atoms.txt

echo ========================================
echo   BYTECODE VERBOSE COMPLETO
echo ========================================
echo ======================================== >> bytecode-atoms.txt
echo   BYTECODE VERBOSE COMPLETO >> bytecode-atoms.txt
echo ======================================== >> bytecode-atoms.txt
echo.
echo. >> bytecode-atoms.txt
javap -v AtomsOfConfusion
javap -v AtomsOfConfusion >> bytecode-atoms.txt
echo.
echo. >> bytecode-atoms.txt

echo ========================================
echo   ANALISANDO TAMANHO POR METODO
echo ========================================
echo ======================================== >> bytecode-atoms.txt
echo   ANALISANDO TAMANHO POR METODO >> bytecode-atoms.txt
echo ======================================== >> bytecode-atoms.txt
echo.
echo. >> bytecode-atoms.txt

powershell -ExecutionPolicy Bypass -Command ^
    "$content = Get-Content 'bytecode-atoms.txt' -Raw; "^
    "$metodos = @('conditionalOperatorConfusing','conditionalOperatorRefactored','preIncrementConfusing','preIncrementRefactored','postIncrementConfusing','postIncrementRefactored','logicAsControlFlowConfusing','logicAsControlFlowRefactored'); "^
    "Write-Host 'METODO                                    BYTES'; "^
    "Add-Content -Path 'bytecode-atoms.txt' -Value 'METODO                                    BYTES'; "^
    "Write-Host '----------------------------------------  -----'; "^
    "Add-Content -Path 'bytecode-atoms.txt' -Value '----------------------------------------  -----'; "^
    "foreach ($m in $metodos) { "^
    "  if ($content -match ($m + '\([^)]*\);[\s\S]*?(\d+):\s+\w*return')) { "^
    "    $bytes = [int]$Matches[1] + 1; "^
    "    $linha = ($m).PadRight(42) + $bytes; "^
    "    Write-Host $linha; "^
    "    Add-Content -Path 'bytecode-atoms.txt' -Value $linha; "^
    "  } "^
    "}"

echo.
echo. >> bytecode-atoms.txt
echo ========================================
echo   COMPARACAO ENTRE ATOMOS
echo ========================================
echo ======================================== >> bytecode-atoms.txt
echo   COMPARACAO ENTRE ATOMOS >> bytecode-atoms.txt
echo ======================================== >> bytecode-atoms.txt
echo.
echo. >> bytecode-atoms.txt

powershell -ExecutionPolicy Bypass -Command ^
    "$content = Get-Content 'bytecode-atoms.txt' -Raw; "^
    "function GetBytes($name) { if ($content -match ($name + '\([^)]*\);[\s\S]*?(\d+):\s+\w*return')) { return [int]$Matches[1] + 1 } return 0 }; "^
    "$pares = @("^
    "  @{nome='Conditional Operator'; c='conditionalOperatorConfusing'; r='conditionalOperatorRefactored'},"^
    "  @{nome='Pre-Increment'; c='preIncrementConfusing'; r='preIncrementRefactored'},"^
    "  @{nome='Post-Increment'; c='postIncrementConfusing'; r='postIncrementRefactored'},"^
    "  @{nome='Logic as Control Flow'; c='logicAsControlFlowConfusing'; r='logicAsControlFlowRefactored'}"^
    "); "^
    "foreach ($p in $pares) { "^
    "  $bc = GetBytes $p.c; "^
    "  $br = GetBytes $p.r; "^
    "  $diff = $br - $bc; "^
    "  Write-Host '----------------------------------------'; "^
    "  Add-Content -Path 'bytecode-atoms.txt' -Value '----------------------------------------'; "^
    "  Write-Host $p.nome; "^
    "  Add-Content -Path 'bytecode-atoms.txt' -Value $p.nome; "^
    "  $l1 = '  Com atomo:   ' + $bc + ' bytes'; "^
    "  $l2 = '  Refatorado:  ' + $br + ' bytes'; "^
    "  $l3 = '  Diferenca:   ' + $diff + ' bytes'; "^
    "  Write-Host $l1; Add-Content -Path 'bytecode-atoms.txt' -Value $l1; "^
    "  Write-Host $l2; Add-Content -Path 'bytecode-atoms.txt' -Value $l2; "^
    "  Write-Host $l3; Add-Content -Path 'bytecode-atoms.txt' -Value $l3; "^
    "  Write-Host ''; Add-Content -Path 'bytecode-atoms.txt' -Value ''; "^
    "}"

echo.
echo. >> bytecode-atoms.txt
echo ========================================
echo   ARQUIVOS GERADOS
echo ========================================
echo ======================================== >> bytecode-atoms.txt
echo   ARQUIVOS GERADOS >> bytecode-atoms.txt
echo ======================================== >> bytecode-atoms.txt
echo   - bytecode-atoms.txt
echo   - bytecode-atoms.txt >> bytecode-atoms.txt
echo.