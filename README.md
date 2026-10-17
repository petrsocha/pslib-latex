# pslib-latex

**LaTeXová šablona pro maturitní, ročníkové a další odborné práce** vytvořená především pro studenty **Střední průmyslové školy a Vyšší odborné školy v Liberci**. Lze ji přizpůsobit i jiným školám.

## Proč použít LaTeX místo Wordu?

Při psaní odborné práce by se měl autor soustředit především na **obsah, nikoli na formátování**. LaTeX odděluje obsah dokumentu od jeho vzhledu: píšete text a označujete jeho strukturu, zatímco o sazbu se stará šablona.

Co vám to přinese?

- **Profesionální typografii.** Kvalitní sazbu textu, dělení slov a česká typografická pravidla.
- **Jednotný vzhled.** Nadpisy, odstavce, tabulky a obrázky se formátují automaticky a konzistentně.
- **Automatické číslování a odkazy.** Po přidání kapitoly nebo obrázku nemusíte nic ručně přečíslovávat.
- **Jednodušší citování.** Zdroje evidujete v jednom souboru a seznam literatury vzniká automaticky.
- **Technický obsah bez zbytečného formátování.** Matematické vzorce, zdrojové kódy, tabulky a schémata jsou přirozenou součástí dokumentu.
- **Přehlednou správu práce.** Kapitoly jsou samostatné textové soubory, které lze snadno upravovat a verzovat například pomocí Gitu.

LaTeX má i nevýhody: zpočátku je nutné naučit se několik příkazů a při psaní nevidíte přímo finální vzhled dokumentu. Právě proto tato šablona obsahuje **hotové formátování a krátké, česky komentované ukázky**. Nemusíte začínat od nuly.

**[Prohlédnout ukázkovou práci (PDF)](ukazka.pdf)**

## Quick Start – začněte během několika minut

Nepotřebujete nic instalovat: stačí prohlížeč a bezplatný účet na [Overleafu](https://www.overleaf.com/).

1. **Zaregistrujte se na Overleafu** nebo se přihlaste.
2. **Stáhněte si tento repozitář:** na GitHubu klikněte na **Code → Download ZIP**.
3. **Vytvořte projekt:** v Overleafu zvolte **New Project → Upload Project** a nahrajte ZIP.
4. **Otevřete `main.tex`** a vyplňte údaje o práci, anotace a případně upravte čestné prohlášení.
5. **Přejděte do `kapitoly/`** a postupně nahraďte demonstrační text vlastní prací.

**Hotovo.** Tlačítkem **Recompile** si kdykoli zobrazíte aktuální PDF. Pokud chcete kapitolu vynechat, přidat nebo změnit její pořadí, upravte příslušné řádky `\input{...}` v `main.tex`.

> **Tip:** Nevíte, jak vložit obrázek, tabulku, vzorec nebo zdrojový kód? Příklady najdete přímo v demonstračních kapitolách včetně komentářů ke zdrojovému zápisu. Soubor `spslib.cls` neupravujte.

## Práce offline – bez Overleafu

Pokud chcete psát i bez připojení k internetu, můžete šablonu používat přímo na svém počítači. **Overleaf doporučujeme pro začátek**, protože nevyžaduje žádnou instalaci; následující programy jsou plnohodnotnou alternativou pro práci offline.

| Operační systém | Doporučený editor | Distribuce LaTeXu |
| --- | --- | --- |
| **Windows** | [TeXstudio](https://texstudio.org/) | [MiKTeX](https://miktex.org/download) nebo [TeX Live](https://www.tug.org/texlive/) |
| **Linux** | [Kile](https://apps.kde.org/cs/kile/) (případně TeXstudio) | [TeX Live](https://www.tug.org/texlive/), obvykle dostupný ze správce balíčků |
| **macOS** | [TeXShop](https://texshop.org/) (případně TeXstudio) | [MacTeX](https://www.tug.org/mactex/), který TeXShop již obsahuje |

**Pozor:** Editor slouží k psaní textu; pro sestavení PDF je potřeba také nainstalovat distribuci LaTeXu. Rozbalte stažený ZIP, otevřete soubor `main.tex` v editoru a nastavte sestavení pomocí `latexmk` a `pdfLaTeXu`. Šablona používá také **Biber** (bibliografie) a **TeXcount** (automatický počet slov), proto je musí vaše instalace obsahovat. U úplné instalace TeX Live nebo MacTeXu bývají k dispozici; při menší instalaci může být potřeba je doinstalovat.

Stejné soubory projektu můžete používat offline i v Overleafu. Při přenášení práce vždy zachovejte celou strukturu složek a všechny soubory, nejen `main.tex`.

## Jak se vyznat v souborech?

| Soubor nebo složka | K čemu slouží |
| --- | --- |
| `main.tex` | Nastavení práce, anotace, prohlášení, výběr kapitol a volitelných částí. |
| `kapitoly/` | Vlastní text práce; výchozí soubory obsahují komentované ukázky. |
| `obrazky/` | Obrázky, fotografie a schémata. |
| `literatura.bib` | Bibliografické údaje o použitých zdrojích. |
| `zkratky.tex` | Zkratky a odborné výrazy včetně jejich vysvětlení. |
| `prilohy/` | Přílohy práce; upravte zejména ukázkový seznam přiložených souborů. |
| `ukazka.pdf` | Předem přeložený **ukázkový** dokument pro náhled na GitHubu. |
| `spslib.cls` | Nastavení sazby šablony; běžně jej neměňte. |
| `latexmkrc` | Nastavení sestavení a automatického počítání slov; neměňte jej. |

Seznam zkratek, seznam tabulek i přílohy můžete podle potřeby vypnout v `main.tex`. Kapitoly Úvod a Závěr jsou nečíslované; ostatní kapitoly se číslují automaticky.

**Delší název práce?** V `main.tex` můžete odkomentovat `\kratkynazevprace{...}` a uvést stručnou variantu názvu pro záhlaví. Na titulní straně zůstane plný název; krátký název není povinný.

## Jak přidat literaturu a citovat?

Šablona používá **číselné citace** ve stylu vycházejícím z ČSN ISO 690. Jednotlivé zdroje zadáváte do `literatura.bib`. Každý zdroj musí mít vlastní **citační klíč**.

Například záznam knihy může vypadat takto:

```bibtex
@book{ukazkovaKniha,
  author    = {Novák, Jan},
  title     = {Úvod do elektroniky},
  date      = {2025},
  publisher = {Ukázkové nakladatelství},
  location  = {Praha}
}
```

*Tento záznam je pouze smyšlený příklad syntaxe, nikoli skutečný zdroj.* Skutečné příklady knihy, datasheetu, webu výrobce a vysokoškolských přednášek už najdete v `literatura.bib`.

V kapitole se pak na zdroj odkážete:

```latex
Základní princip je popsán v odborné literatuře~\cite{ukazkovaKniha}.
```

Ve výsledném PDF se objeví například odkaz **[1]**; číslování a seznam použitých zdrojů se vytvoří automaticky. **Do seznamu literatury se běžně dostanou jen zdroje, které skutečně citujete.**

Záznamy BibTeX/BibLaTeX lze často exportovat z katalogů a odborných databází; automaticky získané údaje vždy zkontrolujte. Pro knihy, datasheety a webové stránky použijte vhodný typ záznamu podle příkladů v projektu.

Další pomoc: [Bibliografie s BibLaTeXem – Overleaf (anglicky)](https://www.overleaf.com/learn/latex/Bibliography_management_with_biblatex) · [ČSN ISO 690:2022 – Citace.com (česky)](https://www.citace.com/CSN-ISO-690).

## Jak vložit podepsané zadání práce?

Titulní list má prázdný rub. Následuje **samostatný list určený pro podepsané zadání** (líce a rub), takže dokument lze správně vytisknout oboustranně.

Máte dvě možnosti:

1. **Papírové zadání:** nic nenastavujte. V PDF zůstane zástupný list a do vytištěné práce vložíte podepsané zadání fyzicky.
2. **Naskenované zadání:** vytvořte soubor `zadani.pdf` obsahující **přesně dvě stránky** – nejprve líc, poté rub zadání (i když je rub prázdný). Nahrajte jej do kořene projektu a v `main.tex` odkomentujte řádek:

   ```latex
   \zadani{zadani.pdf}
   ```

Tím se zástupný list automaticky nahradí oběma stránkami naskenovaného zadání. **Nevkládejte sken ještě jednou ručně** a před odevzdáním zkontrolujte pořadí stránek ve výsledném PDF.

## Odevzdání práce

Před odevzdáním zkontrolujte školní pokyny a požadavky vedoucího práce. Zpravidla je potřeba připravit **obě podoby dokumentace**:

1. **Finální PDF** – aktuální, znovu přeloženou podobu práce určenou pro čtení a tisk. V Overleafu použijte **Download PDF**.
2. **Kompletní editovatelný projekt** – všechny soubory potřebné k opětovnému překladu, zejména `main.tex`, `spslib.cls`, `latexmkrc`, složky `kapitoly/`, `obrazky/`, `prilohy/`, `literatura.bib`, `zkratky.tex` a případný sken zadání. V Overleafu použijte **Download as source (.zip)**.

Tyto soubory se v Overleafu **stahují zvlášť**. Soubor `ukazka.pdf` v repozitáři je pouze *ukázkový náhled*, nikoli vaše hotová práce.

Před odevzdáním nezapomeňte také:

- Vyplnit všechny údaje v `main.tex` a odstranit či nahradit demonstrační obsah.
- Zkontrolovat citace, popisky, odkazy a seznamy, včetně řádného označení převzatého obsahu a použití AI podle školních pravidel.
- Vložit podepsané zadání správným způsobem a zkontrolovat pořadí stran.
- Upravit přílohu **„Seznam přiložených souborů“** v `prilohy/seznam-souboru.tex` podle skutečně odevzdávaných souborů; ukázkové názvy v ní nesmějí zůstat.
- Znovu přeložit celý dokument a ověřit výsledné PDF.

Přiložení samotného `main.tex` **nestačí**: bez ostatních souborů nemusí jít práci znovu sestavit.

## Kde najdu pomoc? – LaTeX FAQ

Nejprve se podívejte do odpovídajícího demonstračního souboru v `kapitoly/`. Pokud příklad nestačí, pomohou následující zdroje:

| Co potřebuji vědět? | Kde hledat odpověď? |
| --- | --- |
| Jak se naučím základy LaTeXu? | [LaTeX pro pragmatiky – Pavel Satrapa (česky)](https://www.nti.tul.cz/~satrapa/docs/latex/) |
| Jak píšu text, nadpisy a seznamy? | [LaTeX za 30 minut – Overleaf (anglicky)](https://www.overleaf.com/learn/latex/Learn_LaTeX_in_30_minutes) |
| Jak vložím nebo zmenším obrázek? | [Vkládání obrázků – Overleaf (anglicky)](https://www.overleaf.com/learn/latex/Inserting_Images) |
| Jak vytvořím tabulku? | [Tabulky – Overleaf (anglicky)](https://www.overleaf.com/learn/latex/Tables) |
| Jak odkazuji na kapitoly, obrázky a tabulky? | [Křížové odkazy – Overleaf (anglicky)](https://www.overleaf.com/learn/latex/Cross_referencing_sections%2C_equations_and_floats) |
| Jak pracuji s bibliografií? | [BibLaTeX – Overleaf (anglicky)](https://www.overleaf.com/learn/latex/Bibliography_management_with_biblatex) |
| Jak citovat podle ČSN ISO 690? | [Průvodce citační normou – Citace.com (česky)](https://www.citace.com/CSN-ISO-690) |
| Jak zapisuji matematické vzorce? | [Matematické výrazy – Overleaf (anglicky)](https://www.overleaf.com/learn/latex/Mathematical_expressions) |
| Co dělat, když překlad končí chybou? | [Řešení chyb – dokumentace Overleafu (anglicky)](https://docs.overleaf.com/troubleshooting-and-support/fixing-latex-errors) |

Další český rozcestník: [LaTeX na českých Wikiknihách](https://cs.wikibooks.org/wiki/LaTeX) (jednotlivé návody mohou být různě aktuální).

### Několik praktických odpovědí

**Jak odkážu na obrázek nebo tabulku?** Přiřaďte objektu `\label{fig:moje-schema}` a v textu použijte `\autoref{fig:moje-schema}`. LaTeX doplní typ objektu a číslo (např. „obrázek 2.1“). Potřebujete-li český pád, napište například `na obrázku~\ref{fig:moje-schema}`.

**Proč se mi nezobrazuje citace nebo odkaz?** Zkontrolujte překlepy v citačních klíčích a `\label`/`\ref`, pak spusťte **Recompile** znovu. Bibliografie i křížové odkazy mohou vyžadovat opakovaný průchod.

**Proč jsou mezi kapitolami prázdné stránky?** Je to záměr: dokument je připraven pro oboustranný tisk a hlavní části začínají na pravé (liché) stránce.

**Proč se projekt nenačítá po nahrání ZIPu z GitHubu?** Zkontrolujte, zda je `main.tex` v **kořeni projektu**, nikoli uvnitř jedné nadřazené složky. Je-li potřeba, přesuňte obsah této složky o úroveň výš. [Podrobnosti v dokumentaci Overleafu](https://docs.overleaf.com/managing-projects-and-files/uploading-a-project).

> **Pozor:** Internetové návody mohou používat jiné balíčky a nastavení. Pro běžné psaní této práce neměňte `spslib.cls` ani `latexmkrc` a nepřebírejte cizí `\documentclass` nebo preambuli do `main.tex`.

## Autor, licence a původ

**Verze:** `1.0beta`. **Copyright © 2026 Petr Socha.** Autor a aktuální správce (*Current Maintainer*) projektu je **Petr Socha**. Zdrojová šablona je šířena pod **LaTeX Project Public License (LPPL) 1.3c nebo novější**, se statusem **`maintained`**. Podrobnosti viz [`LICENSE`](LICENSE), [`LICENSE.tex`](LICENSE.tex) a [`MANIFEST.txt`](MANIFEST.txt).

Šablona je typograficky inspirována šablonou závěrečných prací FIT ČVUT.

**Školní logo `obrazky/logo-skoly.png` pod LPPL nespadá** a před jeho veřejnou distribucí je potřeba ověřit oprávnění školy. Autorská práva k vlastním studentským pracím zůstávají jejich autorům.

Pro připomínky a hlášení chyb slouží po zveřejnění repozitáře [GitHub Issues](https://github.com/petrsocha/pslib-latex/issues). Přehled změn je v [`CHANGELOG.md`](CHANGELOG.md).
