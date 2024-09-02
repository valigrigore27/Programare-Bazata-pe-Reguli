from pyswip import Prolog
import customtkinter as ctk
import re
import itertools

root = ctk.CTk()
root.geometry("650x550")
root.title("SYLLABLES")

prolog = Prolog()
prolog.consult('reguli.pl')

vocale = "aăâeiîou"
consoane = "bcdfghjklmnpqrsștțvwxyz"

def printare_vector(vector):
    cuv = ""
    for i in vector:
        cuv += i
    return cuv

def despartire2(cuvant):
    c = list(prolog.query(f"despartire('{cuvant}', Rezultat)"))
    regula1234 = c[0]['Rezultat']
    return regula1234

def permutari_acelasi_nr_silabe(cuvant):
    silabe = cuvant.split("-")
    permutari_silabe = list(itertools.permutations(silabe))
    lista_cuvinte = []
    for permutare in permutari_silabe:
        cuvant_permutat = printare_vector(permutare)
        cuvant_despartit = despartire2(cuvant_permutat)
        if cuvant_despartit.count('-') == cuvant.count('-'):
            cuvant_fara_separatoare = cuvant_despartit.replace("-", "")
            lista_cuvinte.append(cuvant_fara_separatoare)
    return lista_cuvinte

def cautare_cuvinte():
    cuvinte_cautate = permutari_acelasi_nr_silabe(entry_punct3.get())
    print("Cuvintele ce se pot forma din " + entry_punct3.get() + " sunt: ", cuvinte_cautate)

def despartire():
    c = list(prolog.query(f"despartire('{entry_cuv.get()}', Rezultat)"))
    regula1234 = c[0]['Rezultat']
    print("Cuvantul " + entry_cuv.get() + " despartit in silabe este: " + regula1234)
    return regula1234

def despartit_bine():
    despartit = entry_punct2.get()
    legat = entry_punct2.get().replace("-", "")
    cuvnou = despartire2(legat)
    if cuvnou == despartit:
        print("True")
    else:
        print("False")

title_label = ctk.CTkLabel(root, text="SYLLABLES", font=("Arial", 35, "bold"))
title_label.pack(pady=10)


subtitle_label = ctk.CTkLabel(root, text="Desparte simplu și ușor cu așa un ajutor", font=("Arial", 18, "italic"))
subtitle_label.pack(pady=5)

frame = ctk.CTkFrame(root)
frame.pack(pady=20, padx=30, fill="both", expand=True)

label_option1 = ctk.CTkLabel(frame, text="Option1: Despartire cuvinte", font=("Arial", 25, "bold"))
label_option1.grid(row=0, column=0, columnspan=2, pady=10)

entry_cuv = ctk.CTkEntry(frame, width=300, font=("Arial", 14))
entry_cuv.grid(row=1, column=0, padx=10, pady=10)

button_desparte = ctk.CTkButton(frame, text="Desparte", command=despartire, font=("Arial", 14), width=100, height=40, corner_radius=10)
button_desparte.grid(row=1, column=1, padx=10, pady=10)

label_option2 = ctk.CTkLabel(frame, text="Option2: Verificare despartire corecta", font=("Arial", 25, "bold"))
label_option2.grid(row=2, column=0, columnspan=2, pady=10)

entry_punct2 = ctk.CTkEntry(frame, width=300, font=("Arial", 14))
entry_punct2.grid(row=3, column=0, padx=10, pady=10)

button_verifica = ctk.CTkButton(frame, text="Verifica", command=despartit_bine, font=("Arial", 14), width=100, height=40, corner_radius=10)
button_verifica.grid(row=3, column=1, padx=10, pady=10)

label_option3 = ctk.CTkLabel(frame, text="Option3: Toate cuvintele valide", font=("Arial", 25, "bold"))
label_option3.grid(row=4, column=0, columnspan=2, pady=10)

entry_punct3 = ctk.CTkEntry(frame, width=300, font=("Arial", 14))
entry_punct3.grid(row=5, column=0, padx=10, pady=10)

button_printeaza = ctk.CTkButton(frame, text="Printeaza", command=cautare_cuvinte, font=("Arial", 14), width=100, height=40, corner_radius=10)
button_printeaza.grid(row=5, column=1, padx=10, pady=10)

quote_label = ctk.CTkLabel(root, text="Ce dulce e iubirea\nCe grea e despartirea", font=("Arial", 14, "italic"))
quote_label.pack(side="bottom", pady=10)

root.mainloop()