# AutomaticTests

Sada manuálních a automatických testů pro web města Dubňany (`https://www.dubnany.eu`). Automatizace je psaná v Robot Frameworku se SeleniumLibrary a pokrývá hlavní stránku, kalendář, fotogalerii, projekty, služby, kulturu, úřad, sekci pro seniory i formulář pro hlášení závad.

## Struktura repozitáře
- `HOTOVO/Hierarchie.txt` – strom testovacích sad TS/TC.
- `HOTOVO/<sekce>/Statické testy` – textové scénáře (TSxxx.txt) pro manuální ověření.
- `HOTOVO/<sekce>/Automatické testy` (případně `Automaticke`) – Robot Framework:
  - `ObjectRepository/Url.robot` – centrální proměnné (URL, prohlížeč, timeouty).
  - `TCxxx/Script/*.robot` – testovací případy.
  - `report.html`, `log.html`, `output.xml`, případně `selenium-screenshot-*.png` – výsledky posledního běhu.
- Speciální podsložky ve `MainPage` (např. `Kalendář`, `Založky`) mají vlastní statické i automatické testy.

## Požadavky
- Python 3.11+ a `pip`.
- Nainstalovaný Chrome a odpovídající `chromedriver` v `PATH`.
- Knihovny:  
  ```bash
  pip install robotframework robotframework-seleniumlibrary selenium
  ```

## Spuštění automatických testů
Z kořene repozitáře:
```bash
robot -d results "HOTOVO/MainPage/Automatické testy/TC001/Script/001.robot"
```
- Výstupy (`log.html`, `report.html`, `output.xml`) se uloží do `results`.
- Stejně spusťte další případy, např. `HOTOVO/Fotogalerie/Automaticke testy/TC021/Script/021.robot`.
- Chcete-li změnit prostředí, můžete při běhu přepsat proměnné z `ObjectRepository/Url.robot`, např. `-v URL:https://test.dubnany.eu`.

## Tipy k údržbě
- Před dalším během smažte staré výsledky nebo použijte nový `-d` adresář, aby se reporty nemíchaly.
- Kontrolujte verzi Chromu a `chromedriveru`, případný nesoulad je nejčastější zdroj pádu testů.
- Nové testy strukturovat stejně: proměnné do `ObjectRepository`, skripty do `TCxxx/Script`.
