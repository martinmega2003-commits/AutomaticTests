@echo off
setlocal EnableExtensions EnableDelayedExpansion

REM Pročítá čísla 0–23
for /L %%i in (0,1,23) do (
    REM Vytvoří trojčíslí (000,001,...,023)
    set "num=00%%i"
    set "num=!num:~-3!"

    set "folder=TC!num!"
    echo.
    echo === Spouštím testy ve složce !folder!\script ===

    if exist "!folder!\script" (
        pushd "!folder!\script"

        REM Spustí všechny .robot soubory
        for %%R in (*.robot) do (
            echo --- Spouštím %%R ---
            robot "%%R"
        )

        popd
    ) else (
        echo [Chyba] Složka !folder!\script neexistuje!
    )
)

echo.
echo === Vše hotovo ===
pause
