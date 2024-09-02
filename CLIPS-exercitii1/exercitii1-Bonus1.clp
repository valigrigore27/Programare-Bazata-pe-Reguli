(defglobal ?*PBR* = 0)
(defglobal ?*TPPM* = 0)
(defglobal ?*ACTN* = 0)
(defglobal ?*PJ* = 0)

(defglobal ?*PCPDIT* = 0)
(defglobal ?*CC* = 0)
(defglobal ?*HCI* = 0)
(defglobal ?*ARMS* = 0)

(defglobal ?*RPA* = 0)
(defglobal ?*SCA* = 0)
(defglobal ?*ISSA* = 0)
(defglobal ?*IIL* = 0)

(defglobal ?*Ans* = "y")

(deffunction question (?ans)
	(if(eq ?ans y) 
	then
		(return 1) 
	else
		(return 0)
	)
)
	

(defrule reading
=>
(printout t "Ti-a placut Inteligenta Artificiala?" crlf)
(bind ?*Ans* (read))
(bind ?*PBR* (+ ?*PBR* (question ?*Ans*)))


(printout t "Ti a placut Algoritmica Grafurilor?" crlf)
(bind ?*Ans* (read))
(bind ?*PBR* (+ ?*PBR* (question ?*Ans*)))


(printout t "Iti place Programarea Orientata pe obiect?" crlf)
(bind ?*Ans* (read))
(bind ?*PBR* (+ ?*PBR* (question ?*Ans*)))
(bind ?*TPPM* (+ ?*TPPM* (question ?*Ans*)))


(printout t "Ti a placut sa lucrezi in Java?" crlf)
(bind ?*Ans* (read))
(bind ?*PBR* (+ ?*PBR* (question ?*Ans*)))
(bind ?*TPPM* (+ ?*TPPM* (question ?*Ans*)))
(bind ?*SCA* (+ ?*SCA* (question ?*Ans*)))


(printout t "Ti au placut bazele de date?" crlf)
(bind ?*Ans* (read))
(bind ?*PBR* (+ ?*PBR* (question ?*Ans*)))


(printout t "Te-ai descurcat la matematica si ti-au placut proabilitatile?" crlf)
(bind ?*Ans* (read))
(bind ?*PBR* (+ ?*PBR* (question ?*Ans*)))


(printout t "Iti place C++?" crlf)
(bind ?*Ans* (read))
(bind ?*TPPM* (+ ?*TPPM* (question ?*Ans*)))


(printout t "Ai inteles Fundamentele Algebrice ale Informaticii?" crlf)
(bind ?*Ans* (read))
(bind ?*ACTN* (+ ?*ACTN* (question ?*Ans*)))
(bind ?*RPA* (+ ?*RPA* (question ?*Ans*)))

(printout t "Te-ar interesa dezvoltarea de jocuri?" crlf)
(bind ?*Ans* (read))
(bind ?*PJ* (+ ?*PJ* (question ?*Ans*)))


(printout t "Esti extrovertit si ai vrea sa afli mai multe despre psihologia comunicarii in domeniul tau?" crlf)
(bind ?*Ans* (read))
(bind ?*PCPDIT* (+ ?*PCPDIT* (question ?*Ans*)))


(printout t "Iti plac Sistemele de operare?" crlf)
(bind ?*Ans* (read))
(bind ?*CC* (+ ?*CC* (question ?*Ans*)))


(printout t "Ti-au placut Retelele de Calculatoare?" crlf)
(bind ?*Ans* (read))
(bind ?*CC* (+ ?*CC* (question ?*Ans*)))


(printout t "Te-ai descurcat bine la Tehnologii Web?" crlf)
(bind ?*Ans* (read))
(bind ?*CC* (+ ?*CC* (question ?*Ans*)))


(printout t "Esti familiarizat cu javascript?" crlf)
(bind ?*Ans* (read))
(bind ?*HCI* (+ ?*HCI* (question ?*Ans*)))


(printout t "Esti familiarizat cu Python?" crlf)
(bind ?*Ans* (read))
(bind ?*ARMS* (+ ?*ARMS* (question ?*Ans*)))


(printout t "Ai inteles grafurile " crlf)
(bind ?*Ans* (read))
(bind ?*ARMS* (+ ?*ARMS* (question ?*Ans*)))


(printout t "Ti-a placut LFAC?" crlf)
(bind ?*Ans* (read))
(bind ?*RPA* (+ ?*RPA* (question ?*Ans*)))


(printout t "Ai noțiuni de bază în limbaje de programare?" crlf)
(bind ?*Ans* (read))
(bind ?*IIL* (+ ?*IIL* (question ?*Ans*)))


(if(> ?*PBR* ?*TPPM* ?*ACTN* ?*PJ*)
	then 
	(printout t "Ar trebui sa alegi materia Programare Bazata pe Reguli" crlf)
	else
		(if(> ?*TPPM* ?*ACTN* ?*PJ*)
		then
		(printout t "Ar trebui sa alegi materia Tehnici de Programare pe Platforme Mobile" crlf)
		
		else
			(if(> ?*ACTN* ?*PJ*) 
			then
			(printout t "Ar trebui sa alegi materia Aspecte Computationale in Teoria Numerelor" crlf)
			else
			(printout t "Ar trebui sa alegi materia Proiectarea Jocurilor" crlf)
			)
		)
)

(if(> ?*PCPDIT* ?*CC* ?*HCI* ?*ARMS*)
	then 
	(printout t "Ar trebui sa alegi materia Psihologia Comunicarii Profesionale in Domeniul IT-ului" crlf)
	else
		(if(> ?*CC* ?*HCI* ?*ARMS*)
		then
		(printout t "Ar trebui sa alegi materia Cloud Computing" crlf)
		
		else
			(if(> ?*HCI* ?*ARMS*) 
			then
			(printout t "Ar trebui sa alegi materia Interactiunea Om-Calculator" crlf)
			else
			(printout t "Ar trebui sa alegi materia Analiza Retelelor Media Sociale" crlf)
			)
		)
)

(if(> ?*RPA* ?*SCA* ?*ISSA* ?*IIL*)
	then 
	(printout t "Ar trebui sa alegi materia Retele Petri si Aplicatii" crlf)
	else
		(if(> ?*SCA* ?*ISSA* ?*IIL*)
		then
		(printout t "Ar trebui sa alegi materia Smart Card-uri si Aplicatii" crlf)
		
		else
			(if(> ?*ISSA* ?*IIL*) 
			then
			(printout t "Ar trebui sa alegi materia Inginerie Software Specifica Automobilelor" crlf)
			else
			(printout t "Ar trebui sa alegi materia Introducere in Internetul Lucrurilor" crlf)
			)
		)
)

)