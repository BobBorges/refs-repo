#!/usr/bin/env python3
from glob import glob
import json, os, subprocess, shutil




def main():

    with open("keys.json", 'r') as j:
        keys = json.load(j)

    new_keys = []
    os.chdir("tex")
    for z_key, bibm_key in keys.items():
        with open("citation.tex", "w+") as c:
            c.write("\\nocite{" + z_key + "}\n")
        subprocess.run(["pdflatex", "dummy"])
        subprocess.run(["biber", "dummy"])
        subprocess.run(["biber", "--output-format=bibtex", "-O", f"{bibm_key}.bib", "dummy.bcf"])
#        subprocess.run(["pdflatex", "dummy"])
#        subprocess.run(["pdflatex", "dummy"])

        with open(f"{bibm_key}.bib", 'r') as inf:
            bib = inf.readlines()
        bib[0] = bib[0].replace(z_key, bibm_key)
        with open(f"{bibm_key}.bib", "w+") as outf:
            [outf.write(_) for _ in bib]
        shutil.move(f"{bibm_key}.bib", f"../new-bibs/{bibm_key}.bib")
        exts = ["aux", "bbl", "bcf", "blg", "log", "out", "pdf", "run.xml"]
        for e in exts:
            os.remove(f"dummy.{e}")

        new_keys.append(bibm_key)

    os.chdir("../new-bibs")
    for bib in glob("*.bib"):
        subprocess.run(["/home/bob/.bibmanager/add_bib.sh", bib])


    print("\n"*10)
    [print(_) for _ in sorted(new_keys)]




if __name__ == '__main__':
    main()
