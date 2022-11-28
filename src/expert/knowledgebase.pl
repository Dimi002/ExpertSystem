/*  The predicates holding the lists of symptoms for each disease and the list of values
 *  of the confidence factors are declared as dynamic so that their contents can be updated
 *  (using retractions and assertions) as the program runs.
 */
:- dynamic cf/1.
:- dynamic addisonSymptoms/1.
:- dynamic dermatomyositisSymptoms/1.
:- dynamic hashimotoSymptoms/1.
:- dynamic multipleSclerosisSymptoms/1.
:- dynamic lupusSymptoms/1.
:- dynamic graveSymptoms/1.
:- dynamic myastheniaGravisSymptoms/1.
:- dynamic celiacSymptoms/1.
:- dynamic reactiveArthritisSymptoms/1.
:- dynamic sjogrenSymptoms/1.
:- dynamic perniciousAnemiaSymptoms/1.
:- dynamic rheumatoidArthritisSymptoms/1.
:- dynamic diabetesSymptoms/1.
:- dynamic crohnsSymptoms/1.
:- dynamic alopeciaAreataSymptoms/1.


/* The values of the "constants" used in the system (such as the number of diseases and the minimum
 * age for a patient to be considered an adult, among others) are stored in descriptive predicates.
 */
numberOfDiseases(15).
adultAge(18).
feverEmergencyDiagnosis(40).
slowHeartRateEmergencyDiagnosis(30).
feverDiagnosis(39.5).
slowHeartRateChildDiagnosis(70).
slowHeartRateAdultDiagnosis(60).
cfValueRemove(0.2).
cfValueConclude(0.99).

/* The following predicates are used to hold the list of symptoms for each of the diseases in the
 * symptom. Elements are deleted from this list as the program runs in order to prevent asking the
 * patient duplicate inquiries.
 */
addisonSymptoms([muscleWeakness, fatigue, orthoHypotension, hyperpigmentation, blackFreckles, discoloration, nausea, vomiting, diarrhea, coldSensitivity, weightLoss, dehydration]).
dermatomyositisSymptoms([rashes, redVioletBumps, gottron, muscleWeakness, jointPain, jointSwelling, discoloredSkin, thickenedSkin]).
hashimotoSymptoms([goiter, tiredness, weightGain, coldSensitivity, jointPain, musclePain, constipation, thinningHair, memoryProblem, slowHeartRate, irregularMenstruation]).
multipleSclerosisSymptoms([paresthesia, clumsiness, visionLoss, muscleWeakness, vertigo, fatigue, decreasedBladderControl, shortAttentionSpan, difficultyProcessing, anxiety, constipation, difficultyChewing]).
lupusSymptoms([fatigue, jointSwelling, jointPain, headache, fever, lightSensitivity, chestPain, butterflyRash, hairLoss, mouthSores, raynaud, abdominalPain]).
graveSymptoms([irregularHeartbeat, diarrhea, goiter, heatSensitivity, irritable, muscleWeakness, fatigue, tremblingHands, difficultySleeping, weightLoss, bulgingEyes, doubleVision, eyeSwelling]).
myastheniaGravisSymptoms([droopingEyelid, doubleVision, difficultyFacialExpression, difficultyChewing, difficultySwallowing, slurredSpeech, muscleWeakness, difficultyBreathing]).
celiacSymptoms([abdominalBloating, abdominalPain, constipation, diarrhea, weightLoss, paleStool, skinRashBlister, mouthSores, jointPain, failureToThrive, legTingling, irregularMenstruation]).
reactiveArthritisSymptoms([jointPain, heelPain, backPain, conjunctivitis, eyePain, blurredVision, painfulUrination, frequentUrination, fever, fatigue, hairLoss, mucocutaneousLesion, keratomadermaBlennorrhagicum]).
sjogrenSymptoms([dryEyes, dryMouth, difficultyChewing, difficultySwallowing, raynaud, fatigue, vaginalDryness, musclePain, jointPain,swollenSalivaryGland, rashes]).
perniciousAnemiaSymptoms([fatigue, shortnessOfBreath, dizziness, headache, chestPain, legTingling, muscleWeakness, balanceLoss, nausea, vomiting, constipation, diarrhea, appetiteLoss, weightLoss, redTongue]).
rheumatoidArthritisSymptoms([jointPain, jointStiffness, jointSwelling, bilateralJointProblem, weightLoss, fever, fatigue, muscleWeakness]).
diabetesSymptoms([thirst, frequentUrination, fatigue, weightLoss, oralThrush, blurredVision, persistentCut]).
crohnsSymptoms([abdominalPain, diarrhea, fever, appetiteLoss, weightLoss, skinTag, rectalBleeding, analFissure]).
alopeciaAreataSymptoms([baldPatches, baldAreaItching, fingerNailIssue, hairLoss]).

/* The mapping/2 predicate associates an integer (used as an "index" in this case) with one of the
 * diseases in the system; this predicate is used to systematically process each of the diseases.
 */
mapping(0, addison).
mapping(1, dermatomyositis).
mapping(2, hashimoto).
mapping(3, multipleSclerosis).
mapping(4, lupus).
mapping(5, grave).
mapping(6, myastheniaGravis).
mapping(7, celiac).
mapping(8, reactiveArthritis).
mapping(9, sjogren).
mapping(10, perniciousAnemia).
mapping(11, rheumatoidArthritis).
mapping(12, diabetes).
mapping(13, crohns).
mapping(14, alopeciaAreata).

/* The fullName/2 predicate associates an integer (the same indices used in mapping/2) with the
 * full name of a disease (i.e., the name of the disease to be displayed as a string) to be used
 * in the final diagnosis of the system.
 */
fullName(0, "Addison disease.").
fullName(1, "dermatomyositis.").
fullName(2, "Hashimoto thyroiditis.").
fullName(3, "multiple sclerosis.").
fullName(4, "lupus.").
fullName(5, "Grave's disease.").
fullName(6, "myasthenia gravis.").
fullName(7, "celiac disease.").
fullName(8, "reactive arthritis.").
fullName(9, "Sjogren syndrome.").
fullName(10, "pernicious anemia.").
fullName(11, "rheumatoid arthritis.").
fullName(12, "type I diabetes.").
fullName(13, "Crohn's disease.").
fullName(14, "alopecia areata.").

/* The weight/2 predicate associates each of the 94 unique symptoms present in the system with its
 * associated weight to be used in the computation of confidence factors.
 */
weight(abdominalBloating, 0.9333).
weight(abdominalPain, 0.8).
weight(analFissure, 0.9333).
weight(anxiety, 0.9333).
weight(backPain, 0.9333).
weight(baldAreaItching, 0.9333).
weight(baldPatches, 0.9333).
weight(bilateralJointProblem, 0.9333).
weight(blackFreckles, 0.9333).
weight(blurredVision, 0.8667).
weight(bulgingEyes, 0.9333).
weight(butterflyRash, 0.9333).
weight(chestPain, 0.8667).
weight(clumsiness, 0.9333).
weight(conjunctivitis, 0.9333).
weight(constipation, 0.7333).
weight(shortAttentionSpan, 0.9333).
weight(decreasedBladderControl, 0.9333).
weight(dehydration, 0.9333).
weight(diarrhea, 0.6667).
weight(difficultyBreathing, 0.9333).
weight(difficultyChewing, 0.8).
weight(difficultyFacialExpression, 0.9333).
weight(difficultyProcessing, 0.9333).
weight(difficultySleeping, 0.9333).
weight(difficultySwallowing, 0.9333).
weight(discoloration, 0.9333).
weight(discoloredSkin, 0.9333).
weight(dizziness, 0.9333).
weight(doubleVision, 0.8667).
weight(droopingEyelid, 0.9333).
weight(dryEyes, 0.9333).
weight(dryMouth, 0.9333).
weight(eyePain, 0.9333).
weight(eyelidRash, 0.9333).
weight(eyeSwelling, 0.9333).
weight(failureToThrive, 0.9333).
weight(fatigue, 0.4).
weight(fever, 0.7333).
weight(fingerNailIssue, 0.9333).
weight(frequentUrination, 0.8667).
weight(goiter, 0.8667).
weight(gottron, 0.9333).
weight(hairLoss, 0.8667).
weight(headache, 0.8667).
weight(heelPain, 0.9333).
weight(hyperpigmentation, 0.9333).
weight(irregularHeartbeat, 0.9333).
weight(irregularMenstruation, 0.8667).
weight(irritable, 0.9333).
weight(jointPain, 0.6).
weight(jointSwelling, 0.7333).
weight(jointStiffness, 0.9333).
weight(keratomadermaBlennorrhagicum, 0.9333).
weight(legTingling, 0.8667).
weight(limbsSwelling, 0.9333).
weight(appetiteLoss, 0.9333).
weight(balanceLoss, 0.9333).
weight(visionLoss, 0.8667).
weight(lowFever, 0.9333).
weight(memoryProblem, 0.9333).
weight(mouthSores, 0.8667).
weight(muscleCramps, 0.9333).
weight(musclePain, 0.9333).
weight(muscleWeakness, 0.5333).
weight(mucocutaneousLesion, 0.9333).
weight(nausea, 0.8667).
weight(oralThrush, 0.8667).
weight(orthoHypotension, 0.9333).
weight(painfulUrination, 0.9333).
weight(paleStool, 0.9333).
weight(paresthesia, 0.9333).
weight(persistentCut, 0.9333).
weight(skinRashBlister, 0.9333).
weight(rashes, 0.9333).
weight(raynaud, 0.8667).
weight(rectalBleeding, 0.9333).
weight(redTongue, 0.9333).
weight(redVioletBumps, 0.9333).
weight(coldSensitivity, 0.8667).
weight(heatSensitivity, 0.9333).
weight(lightSensitivity, 0.9333).
weight(shortnessOfBreath, 0.9333).
weight(skinTag, 0.9333).
weight(slowHeartRate, 0.9333).
weight(slurredSpeech, 0.9333).
weight(swollenSalivaryGland, 0.9333).
weight(thickenedSkin, 0.9333).
weight(thinningHair, 0.9333).
weight(thirst, 0.9333).
weight(tiredness, 0.9333).
weight(tremblingHands, 0.9333).
weight(vaginalDryness, 0.6667).
weight(vertigo, 0.9333).
weight(vomiting, 0.8667).
weight(weightGain, 0.9333).
weight(weightLoss, 0.4667).

/* The display/2 predicate associates each of the 94 unique symptoms present in the system with its
 * associated inquiry, composed of the following parts:
 *    1. The user to whom the inquiry is intended (either the patient or the healthcare worker attending
 *       to them
 *    2. The inquiry written in English
 *    3. The Filipino translation of the inquiry
 */
display(abdominalBloating, "PATIENT: Do you experience abdominal bloating? Nakararanas ka ba ng pamamaga sa bandang tiyan?").
display(abdominalPain, "PATIENT: Do you experience abdominal pain? Nakararanas ka ba ng pananakit sa bandang tiyan?").
display(analFissure, "HCW: Does the patient have anal fissures? Mayroon bang malapunit na pagsusugat sa bandang puwetan?").
display(anxiety, "PATIENT: Do you experience increased anxiety? Nakararanas ka ba ng mas malalang pagkabalisa?").
display(backPain, "PATIENT: Do you experience back pain? Nakararanas ka ba ng pananakit sa bandang likod?").
display(baldAreaItching, "PATIENT: Do you experience mild itching, tingling, tenderness, or burning on bald areas? Nakararanas ka ba ng bahagyang pangangati, sensasyong parang tinutusok, o hapdi sa mga rehiyong nakalbo?").
display(baldPatches, "PATIENT: Do you have round or oval patches of baldness on your scalp? Mayroon ka bang bilog o malabilog na patse ng pagkakalbo sa iyong anit?").
display(bilateralJointProblem, "PATIENT: Do you experience pain, stiffness, or swelling of the joints of both sides of the body at the same time? Nakararanas ka ba ng pananakit, paninigas, o pamamaga ng mga kasukasuan nang magkasabay sa parehong rehiyon ng katawan?").
display(blackFreckles, "PATIENT: Do you have black freckles on your forehead, face, neck, or shoulders? Mayroon ka bang mga itim na pekas sa iyong noo, mukha, leeg, o balikat?").
display(blurredVision, "PATIENT: Do you experience blurred vision? Nakararanas ka ba ng panlalabo sa iyong paningin?").
display(bulgingEyes, "HCW: Does the patient have bulging eyes? Nakaumbok ba ang mata ng pasyente?").
display(butterflyRash, "PATIENT: Do you have a butterfly-shaped rash on your cheeks or nose? Mayroon ka bang pantal na hugis-paruparo sa iyong pisngi o ilong?").
display(chestPain, "PATIENT: Do you experience chest pain? Nakararanas ka ba ng pananakit sa bandang dibdib?").
display(clumsiness, "PATIENT: Have you noticed an increase in clumsiness? Mayroon ka bang napapansing paghina sa iyong pokus o koordinasyon?").
display(conjunctivitis, "HCW: Does the patient have conjunctivitis (redness of the eyes)? Mayroon bang conjuctivitis (pamumula ng mata) ang pasyente?").
display(constipation, "PATIENT: Do you experience constipation? Nakararanas ka ba ng pagtitibi?").
display(shortAttentionSpan, "PATIENT: Have you noticed a decrease in attention span? Mayroon ka bang napapansing pagbaba sa tagal ng iyong panuunan?").
display(decreasedBladderControl, "PATIENT: Have you noticed a decrease in bladder control? Mayroon ka bang napapansing pagbaba sa kontrol ng iyong pantog?").
display(dehydration, "PATIENT: Do you experience dehydration? Nakararanas ka ba ng labis na kawalan ng tubig sa katawan?").
display(diarrhea, "PATIENT: Do you experience diarrhea? Nakararanas ka ba ng pagtatae?").
display(difficultyBreathing, "PATIENT: Do you experience difficulty breathing? Nahihirapan ka bang huminga?").
display(difficultyChewing, "PATIENT: Do you experience difficulty chewing? Nahihirapan ka bang ngumuya?").
display(difficultyFacialExpression, "PATIENT: Do you experience difficulty controlling your facial muscles and making facial expressions? Nahihirapan ka bang ikilos ang iyong mukha (upang ngumiti, sumimangot, atbp.)?").
display(difficultyProcessing, "PATIENT: Do you experience difficulty processing new information? Nahihirapan ka bang makaunawa ng mga bagong impormasyon?").
display(difficultySleeping, "PATIENT: Do you experience difficulty sleeping? Nahihirapan ka bang makatulog?").
display(difficultySwallowing, "PATIENT: Do you experience difficulty swallowing? Nahihirapan ka bang lumulon?").
display(discoloration, "PATIENT: Have you noticed bluish black discolorations around your lips, mouth, or rectum? Mayroon ka bang napapansing mga bughaw o itim na diskolorasyon sa palibot ng iyong labi, bibig, o puwetan?").
display(discoloredSkin, "PATIENT: Have you noticed discolored skin around your shoulders, neck, or upper back? Mayroon ka bang napapansing diskolorasyon sa palibot ng iyong balikat, leeg, o bandang itaas ng likod?").
display(dizziness, "PATIENT: Do you experience dizziness? Nakararanas ka ba ng pagkahilo?").
display(doubleVision, "PATIENT: Do you experience double vision? Nakararanas ka ba ng pagdoble ng paningin?").
display(droopingEyelid, "HCW: Does the patient have drooping eyelids? Lumalawlaw ba ang takipmata ng pasyente?").
display(dryEyes, "PATIENT: Do you have dry eyes? Nakararamdam ka ba ng panunuyot sa bandang mata?").
display(dryMouth, "PATIENT: Do you have a dry mouth? Nakararamdam ka ba ng panunuyot sa bandang bibig?").
display(eyePain, "PATIENT: Do you experience eye pain? Nakararamdam ka ba ng pananakit sa bandang mata?").
display(eyelidRash, "PATIENT: Do you notice a reddish-purple rash around your eyelids? Mayroon ka bang napapansing mapula-pula o lilang pantal sa palibot ng iyong takipmata?").
display(eyeSwelling, "PATIENT: Do you have swollen eyes? Nakararanas ka ba ng pamamaga ng iyong mga mata?").
display(failureToThrive, "HCW: Does the patient exhibit a failure to thrive (undernourishment, stunted growth, etc.)? Nakararanas ba ang pasyente ng pagkabigo sa paglaki (mababang antas ng nutrisyon, pagkabansot, atbp.)?").
display(fatigue, "PATIENT: Do you experience fatigue? Nakararanas ka ba ng labis na pagkapagod?").
display(fever, "PATIENT: Input your temperature (in degrees Celsius). Ilagay ang iyong temperatura.").
display(fingerNailIssue, "PATIENT: Do you notice pits, dents, grooves, or redness on your fingernails? Mayroon ka bang napapansing bitak, uka, o pamumula sa mga kuko sa iyong daliri?").
display(frequentUrination, "PATIENT: Have you been urinating more frequently? Mayroon ka bang napapansing pagdalas sa iyong pag-ihi?").
display(goiter, "HCW: Does the patient have a goiter (swelling on the neck due to an enlarged thyroid)? Mayroon bang goiter (pamamaga ng leeg dahil sa abnormal na paglaki ng tiroideo) ang pasyente?").
display(gottron, "HCW: Does the patient have Gottron papules (red or violet bumps on the joints of the hand)? Mayroon bang Gottron papules (pula o lilang umbok sa mga kasukasuan ng kamay) ang pasyente?").
display(hairLoss, "PATIENT: Have you experienced increased hair loss? Nakararanas ka ba ng mas matinding pagkalugas ng buhok?").
display(headache, "PATIENT: Do you have frequent headaches? Nakararanas ka ba ng madalas na pananakit ng ulo?").
display(heelPain, "PATIENT: Do you experience heel pain? Nakararanas ka ba ng pananakit sa bandang takong?").
display(hyperpigmentation, "HCW: Does the patient have hyperpigmentation (darker skin near scars, skin folds, or joints)? Mayroon bang hyperpigmentation ang pasyente (pangingitim malapit sa mga peklat, kulubot, o kasukasuan?").
display(irregularHeartbeat, "HCW: Does the patient have an irregular heartbeat? Iregular ba ang pagtibok ng puso ng pasyente?").
display(irregularMenstruation, "PATIENT: Have you noticed irregularities in your menstrual cycle? Mayroon ka bang napapansing iregularidad sa iyong regla?").
display(irritable, "PATIENT: Have you noticed an increase in irritability? Mayroon ka bang napapansing pagtaas sa iyong iritabilidad?").
display(jointPain, "PATIENT: Do you experience joint pain? Nakararanas ka ba ng pananakit sa iyong mga kasukasuan?").
display(jointSwelling, "PATIENT: Have you noticed swelling on your joints? Nakararanas ka ba ng pamamaga sa iyong mga kasukasuan?").
display(jointStiffness, "PATIENT: Have you noticed stiffness on your joints? Nakararanas ka ba ng waring paninigas sa iyong mga kasukasuan?").
display(keratomadermaBlennorrhagicum, "HCW: Does the patient have keratoderma blennorrhagicum (reddish crusts on the palms, soles, or around the nails)? Mayroon bang keratoderma blennorrhagicum (mapupulang pagbibiyak sa palad, talampakan, at sa palibot ng mga kuko) ang pasyente?").
display(legTingling, "PATIENT: Have you experienced a tingling sensation in your legs? Nakararamdam ka ba ng sensasyong parang tinutusok sa iyong mga binti?").
display(limbsSwelling, "PATIENT: Have you noticed swelling on your limbs? Mayroon ka bang napapansing pamamaga sa iyong mga braso o binti?").
display(appetiteLoss, "PATIENT: Have you experienced a loss of appetite? Nakararanas ka ba ng pagkawala ng gana sa pagkain?").
display(balanceLoss, "PATIENT: Have you experienced a loss of balance? Nakararanas ka ba ng pagkawala ng balanse?").
display(visionLoss, "PATIENT: Have you experienced a loss of vision? Nakararanas ka ba ng pagkawala ng paningin?").
display(memoryProblem, "PATIENT: Have you experienced memory problems? Nakararanas ka ba ng paghina ng iyong memorya?").
display(mouthSores, "PATIENT: Do you have mouth sores? Mayroon ka bang mga singaw sa bibig?").
display(muscleCramps, "PATIENT: Have you experienced muscle cramps? Nakararanas ka ba ng pulikat?").
display(musclePain, "PATIENT: Have you experienced muscle pain? Nakararamdam ka ba ng pananakit ng kalamnan?").
display(muscleWeakness, "PATIENT: Have you experienced muscle weakness? Nakararamdam ka ba ng panghihina ng kalamnan?").
display(mucocutaneousLesion, "HCW: Does the patient have mucocutaneous lesions (small ulcers) inside the mouth or tongue? Mayroon bang mga mucocutaneous lesion o maliliit na ulser ang pasyente sa loob ng bibig o dila?").
display(nausea, "PATIENT: Have you experienced nausea? Nakararamdam ka ba ng pagkaduwal?").
display(oralThrush, "HCW: Does the patient have recurrent oral thrush (white patches in the mouth accompanied by soreness or mouth pain)? Mayroon bang oral thrush (puting patse sa bibig na may kasamang pamamaga o pananakit) ang pasyente?").
display(orthoHypotension, "PATIENT: Do you experience sudden dizziness when standing up? Nakararamdam ka ba ng biglang pagkahilo kapag tumatayo?").
display(painfulUrination, "PATIENT: Do you experience pain when you urinate? Nakararamdam ka ba ng pananakit kapag umiihi?").
display(paleStool, "PATIENT: Have you noticed excreting pale stools? Maputla ba ang iyong dumi?").
display(paresthesia, "PATIENT: Have you experienced a tingling sensation or numbness on your limbs, trunk, or the side of your face? May nararamdaman ka bang sensasyong parang tinutusok o pagkamanhid sa iyong braso, binti, katawan, o sa bandang gilid ng iyong mukha?").
display(persistentCut, "PATIENT: Do you have cuts or grazes that do not heal? Mayroon ka bang mga sugar na matagal nang hindi pa naghihilom?").
display(skinRashBlister, "PATIENT: Do you have a skin rash that causes blisters? Mayroon ka bang mga pantal sa balat na maaaring magpaltos?").
display(rashes, "PATIENT: Do you have a reddish-purple rash around your eyelids? Mayroon bang mapula o lilang pagpapantal sa palibot ng takipmata?").
display(raynaud, "HCW: Does the patient have Raynaud's disease (fingers and toes turn white or blue and feel numb)? Mayroon bang Raynaud's disease ang pasyente (namamanhid at namumuti ang mga daliri sa paa at kamay)?").
display(rectalBleeding, "PATIENT: Have you noticed any rectal bleeding? Mayroon ka bang napapansing pagdurugo sa iyong bandang puwetan, partikular sa labasan ng dumi?").
display(redTongue, "PATIENT: Have you noticed your tongue being unusually smooth, thick, or red? Mayroon ka bang napapansing kakaibang pagkinis, pagkapal, o pamumula ng iyong dila?").
display(redVioletBumps, "PATIENT: Do you have red or violet lumps on your knees or elbows? Mayroon ka bang napapansing mga pula o lilang bukol sa iyong tuhod o siko?").
display(coldSensitivity, "PATIENT: Have you noticed an increased sensitivity to cold? Mayroon ka bang napapansing pagtaas sa iyong sensitibidad sa lamig?").
display(heatSensitivity, "PATIENT: Have you noticed an increased sensitivity to heat? Mayroon ka bang napapansing pagtaas sa iyong sensitibidad sa init?").
display(lightSensitivity, "PATIENT: Have you noticed an increased sensitivity to sunlight or fluorescent light? Mayroon ka bang napapansing pagtaas sa iyong sensitibidad sa sinag o liwanag?").
display(shortnessOfBreath, "PATIENT: Have you experienced shortness of breath? Nakararamdam ka ba ng kakapusan sa hangin kapag humihinga?").
display(skinTag, "PATIENT: Do you have skin tags on your buttocks? Mayroon bang mga malakulugo o malakuntil na lamang matatagpuan sa bandang puwetan?").
display(slowHeartRate, "HCW: Input the patient's heart rate (in beats per minute). Ilagay ang bilis ng pagtibok ng puso ng pasyente kada minuto.").
display(slurredSpeech, "PATIENT: Have you noticed any slurring when you speak? Mayroon ka bang napapansing pagkautal kapag ikaw ay nagsasalita?").
display(swollenSalivaryGland, "HCW: Does the patient have swollen salivary glands? Namamamaga ba ang glandulang panlaway ng pasyente?").
display(thickenedSkin, "PATIENT: Do you have thickened skin on the bases and sides of your fingernails? Mayroon ka bang napapansing pangangapal ng balat sa bandang ibaba at gilid ng iyong mga kuko?").
display(thinningHair, "PATIENT: Do you have thinning hair? Nakararanas ka ba ng bahagyang pagkakalbo o pagkalugas ng buhok?").
display(thirst, "PATIENT: Have you noticed an increase in thirst? Nakararanas ka ba ng mas malalang pagkauhaw?").
display(tiredness, "PATIENT: Have you noticed an increase in tiredness? Nakararanas ka ba ng mas malalang pagkapagod?").
display(tremblingHands, "PATIENT: Do you have trembling hands? Nakararanas ka ba ng panginginig ng kamay?").
display(vaginalDryness, "PATIENT: Do you experience dryness in your pubic area? Nakararanas ka ba ng panunuyot sa bandang ari?").
display(vertigo, "PATIENT: Do you experience vertigo? Nakararanas ka ba ng bertigo?").
display(vomiting, "PATIENT: Do you experience vomiting? Nakararanas ka ba ng pagsusuka?").
display(weightGain, "PATIENT: Have you noticed undergoing a sudden weight gain? Mayroon ka bang napapansing biglang pagtaas sa iyong timbang?").
display(weightLoss, "PATIENT: Have you noticed undergoing a sudden weight loss? Mayroon ka bang napapansing biglang pagbaba sa iyong timbang?").

/* The list of confidence factors, one for each of the fifteen diseases
 * in the knowledge base, is stored using the predicate cf/1.
 */
cf([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]).

/**
 * deleteOne(+X : string).
 *
 * Succeeds if L1 is a list present in the knowledge base
 * (specifically, the list of symptoms of alopecia areata).
 *
 * @param X the symptom to be deleted from L1.
 */
deleteOne(X) :-
     /* The passed symptom is deleted from the list. Afterwards, the original list is retracted and the
      * new list is asserted to the knowledge base.
      */
    alopeciaAreataSymptoms(L1),
    delete(L1, X, NL1),
    retract(alopeciaAreataSymptoms(L1)),
    asserta(alopeciaAreataSymptoms(NL1)).

/**
 * deleteTwo(+X : string).
 *
 * Succeeds if L2 is a list present in the knowledge base (specifically, the list of symptoms of
 * Crohn's disease).
 *
 * @param X the symptom to be deleted from L2.
 */
deleteTwo(X) :-
     /* The passed symptom is deleted from the list. Afterwards, the original list is retracted and the
      * new list is asserted to the knowledge base.
      */
    crohnsSymptoms(L2),
    delete(L2, X, NL2),
    retract(crohnsSymptoms(L2)),
    asserta(crohnsSymptoms(NL2)).

/**
 * deleteThree(+X : string).
 *
 * Succeeds if L3 is a list present in the knowledge base (specifically, the list of symptoms of
 * type I diabetes).
 *
 * @param X the symptom to be deleted from L3.
 */
deleteThree(X) :-
    /* The passed symptom is deleted from the list. Afterwards, the original list is retracted and the
     * new list is asserted to the knowledge base.
     */
    diabetesSymptoms(L3),
    delete(L3, X, NL3),
    retract(diabetesSymptoms(L3)),
    asserta(diabetesSymptoms(NL3)).

/**
 * deleteFour(+X : string).
 *
 * Succeeds if L4 is a list present in the knowledge base (specifically, the list of symptoms of
 * rheumatoid arthritis).
 *
 * @param X the symptom to be deleted from L4.
 */
deleteFour(X) :-
    /* The passed symptom is deleted from the list. Afterwards, the original list is retracted and the
     * new list is asserted to the knowledge base.
     */
    rheumatoidArthritisSymptoms(L4),
    delete(L4, X, NL4),
    retract(rheumatoidArthritisSymptoms(L4)),
    asserta(rheumatoidArthritisSymptoms(NL4)).

/**
 * deleteFive(+X : string).
 *
 * Succeeds if L5 is a list present in the knowledge base (specifically, the list of symptoms of
 * pernicious anemia).
 *
 * @param X the symptom to be deleted from L5.
 */
deleteFive(X) :-
    /* The passed symptom is deleted from the list. Afterwards, the original list is retracted and the
     * new list is asserted to the knowledge base.
     */
    perniciousAnemiaSymptoms(L5),
    delete(L5, X, NL5),
    retract(perniciousAnemiaSymptoms(L5)),
    asserta(perniciousAnemiaSymptoms(NL5)).

/**
 * deleteSix(+X : string).
 *
 * Succeeds if L6 is a list present in the knowledge base (specifically, the list of symptoms of
 * Sjogren syndrome).
 *
 * @param X the symptom to be deleted from L6.
 */
deleteSix(X) :-
    /* The passed symptom is deleted from the list. Afterwards, the original list is retracted and the
     * new list is asserted to the knowledge base.
     */
    sjogrenSymptoms(L6),
    delete(L6, X, NL6),
    retract(sjogrenSymptoms(L6)),
    asserta(sjogrenSymptoms(NL6)).

/**
 * deleteSeven(+X : string).
 *
 * Succeeds if L7 is a list present in the knowledge base (specifically, the list of symptoms of
 * reactive arthritis).
 *
 * @param X the symptom to be deleted from L7.
 */
deleteSeven(X) :-
    /* The passed symptom is deleted from the list. Afterwards, the original list is retracted and the
     * new list is asserted to the knowledge base.
     */
    reactiveArthritisSymptoms(L7),
    delete(L7, X, NL7),
    retract(reactiveArthritisSymptoms(L7)),
    asserta(reactiveArthritisSymptoms(NL7)).

/**
 * deleteEight(+X : string).
 *
 * Succeeds if L8 is a list present in the knowledge base (specifically, the list of symptoms of
 * celiac disease).
 *
 * @param X the symptom to be deleted from L8.
 */
deleteEight(X) :-
    /* The passed symptom is deleted from the list. Afterwards, the original list is retracted and the
     * new list is asserted to the knowledge base.
     */
    celiacSymptoms(L8),
    delete(L8, X, NL8),
    retract(celiacSymptoms(L8)),
    asserta(celiacSymptoms(NL8)).

/**
 * deleteNine(+X : string).
 *
 * Succeeds if L9 is a list present in the knowledge base (specifically, the list of symptoms of
 * myasthenia gravis).
 *
 * @param X the symptom to be deleted from L9.
 */
deleteNine(X) :-
    /* The passed symptom is deleted from the list. Afterwards, the original list is retracted and the
     * new list is asserted to the knowledge base.
     */
    myastheniaGravisSymptoms(L9),
    delete(L9, X, NL9),
    retract(myastheniaGravisSymptoms(L9)),
    asserta(myastheniaGravisSymptoms(NL9)).

/**
 * deleteTen(+X : string).
 *
 * Succeeds if L10 is a list present in the knowledge base (specifically, the list of symptoms of
 * Grave's disease).
 *
 * @param X the symptom to be deleted from L10.
 */
deleteTen(X) :-
    /* The passed symptom is deleted from the list. Afterwards, the original list is retracted and the
     * new list is asserted to the knowledge base.
     */
    graveSymptoms(L10),
    delete(L10, X, NL10),
    retract(graveSymptoms(L10)),
    asserta(graveSymptoms(NL10)).

/**
 * deleteEleven(+X : string).
 *
 * Succeeds if L11 is a list present in the knowledge base (specifically, the list of symptoms of
 * lupus).
 *
 * @param X the symptom to be deleted from L11.
 */
deleteEleven(X) :-
    /* The passed symptom is deleted from the list. Afterwards, the original list is retracted and the
     * new list is asserted to the knowledge base.
     */
    lupusSymptoms(L11),
    delete(L11, X, NL11),
    retract(lupusSymptoms(L11)),
    asserta(lupusSymptoms(NL11)).

/**
 * deleteTwelve(+X : string).
 *
 * Succeeds if L12 is a list present in the knowledge base (specifically, the list of symptoms of
 * multiple sclerosis).
 *
 * @param X the symptom to be deleted from L12.
 */
deleteTwelve(X) :-
    /* The passed symptom is deleted from the list. Afterwards, the original list is retracted and the
     * new list is asserted to the knowledge base.
     */
    multipleSclerosisSymptoms(L12),
    delete(L12, X, NL12),
    retract(multipleSclerosisSymptoms(L12)),
    asserta(multipleSclerosisSymptoms(NL12)).

/**
 * deleteThirteen(+X : string).
 *
 * Succeeds if L13 is a list present in the knowledge base (specifically, the list of symptoms of
 * Hashimoto thyroiditis).
 *
 * @param X the symptom to be deleted from L13.
 */
deleteThirteen(X) :-
    /* The passed symptom is deleted from the list. Afterwards, the original list is retracted and the
     * new list is asserted to the knowledge base.
     */
    hashimotoSymptoms(L13),
    delete(L13, X, NL13),
    retract(hashimotoSymptoms(L13)),
    asserta(hashimotoSymptoms(NL13)).

/**
 * deleteFourteen(+X : string).
 *
 * Succeeds if L14 is a list present in the knowledge base (specifically, the list of symptoms of
 * dermatomyositis).
 *
 * @param X the symptom to be deleted from L14.
 */
deleteFourteen(X) :-
    /* The passed symptom is deleted from the list. Afterwards, the original list is retracted and the
     * new list is asserted to the knowledge base.
     */
    dermatomyositisSymptoms(L14),
    delete(L14, X, NL14),
    retract(dermatomyositisSymptoms(L14)),
    asserta(dermatomyositisSymptoms(NL14)).

/**
 * deleteFifteen(+X : string).
 *
 * Succeeds if L15 is a list present in the knowledge base (specifically, the list of symptoms of
 * Addison disease).
 *
 * @param X the symptom to be deleted from L15.
 */
deleteFifteen(X) :-
    /* The passed symptom is deleted from the list. Afterwards, the original list is retracted and the
     * new list is asserted to the knowledge base.
     */
    addisonSymptoms(L15),
    delete(L15, X, NL15),
    retract(addisonSymptoms(L15)),
    asserta(addisonSymptoms(NL15)).

/**
 * deleteAll(+Symptom : string).
 *
 * Succeeds if the deletion rules for each of the diseases (deleteOne/1 through deleteFifteen/1)
 * are defined in the knowledge base.
 *
 * @param Symptom the symptom to be deleted from the lists of symptoms of each disease.
 */
deleteAll(Symptom) :-
    /* The passed symptom is deleted from the list of symptoms of each of the fifteen diseases
     * in the knowledge base.
     */
    deleteOne(Symptom),
    deleteTwo(Symptom),
    deleteThree(Symptom),
    deleteFour(Symptom),
    deleteFive(Symptom),
    deleteSix(Symptom),
    deleteSeven(Symptom),
    deleteEight(Symptom),
    deleteNine(Symptom),
    deleteTen(Symptom),
    deleteEleven(Symptom),
    deleteTwelve(Symptom),
    deleteThirteen(Symptom),
    deleteFourteen(Symptom),
    deleteFifteen(Symptom).

/**
 * getDiagnosis(+CF : float, +Index : integer, +Emergency : string,
 * -Response: string).
 *
 * Succeeds if a mapping exists from the passed index to one of the diseases in the
 * knowledge base.
 *
 * Used to build part of the final diagnosis to be displayed based on
 * the highest confidence factor in the maintained list and its
 * associated disease.
 *
 * @param CF the highest confidence factor from the list of confidence factors.
 * @param Index the index of the highest confidence factor.
 * @param Emergency a string specifying whether an emergency situation was discovered
 *		  during the diagnosis.
 * @param Response the final diagnosis of the system.
 */

getDiagnosis(CF, Index, _, Response) :-
   /* If the highest confidence factor is greater than or equal to 0.99, Index is used to
    * retrieve the full name of the diagnosed disease, and the diagnosis is displayed as
    * "you most likely have [DISEASE]".
    */
    CF >= 0.99,
    fullName(Index, Disease),
    string_concat(", you most likely have ", Disease, Response).

getDiagnosis(CF, Index, _, Response) :-
   /* If the highest confidence factor is greater than or equal to 0.7 but less
    * than 0.99, Index is used to retrieve the full name of the diagnosed disease,
    * and the diagnosis is displayed as "you likely have [DISEASE]".
    */
    CF >= 0.7,
    fullName(Index, Disease),
    string_concat(", you likely have ", Disease, Response).

getDiagnosis(CF, Index, _, Response) :-
   /* If the highest confidence factor is greater than or equal to 0.5 but less
    * than 0.7, Index is used to retrieve the full name of the diagnosed disease,
    * and the diagnosis is displayed as "you may have [DISEASE]".
    */
    CF >= 0.5,
    fullName(Index, Disease),
    string_concat(", you may have ", Disease, Response).

getDiagnosis(CF, Index, _, Response) :-
   /* If the highest confidence factor is greater than 0.2 but less than 0.5,
    * Index is used to retrieve the full name of the diagnosed disease,
    * and the diagnosis is displayed as "you exhibit some
    * symptoms of [DISEASE]".
    */
    CF > 0.2,
    fullName(Index, Disease),
    string_concat(", you exhibit some symptoms of ", Disease, Response).

getDiagnosis(_, _, Emergency, Response) :-
   /* If the highest confidence factor is less than 0.2 and there is no
    * emergency, the diagnosis is displayed as "a diagnosis cannot be
    * made. Please refer to a large medical facility as needed".
    */
    Emergency = false,
    Response = ", a diagnosis cannot be made. Please refer to a large medical facility as needed.".

getDiagnosis(_, Index, _, Response) :-
   /* If the highest confidence factor is less than 0.2 and there is an
    * emergency, Index is used to retrieve the full name of the diagnosed
    * disease, and the diagnosis is displayed as "you exhibit some
    * symptoms of [DISEASE]".
    */
    fullName(Index, Disease),
    string_concat(", you exhibit some symptoms of ", Disease, Response).

/**
 * finalDiagnosis(+Name : string, +CF : float, +Index : integer,
 * +Emergency : string, -FinalString: string).
 *
 * Succeeds if a mapping exists from the passed index to one of the diseases in the
 * knowledge base.
 *
 * Used to build the final diagnosis to be displayed based on the highest confidence
 * factor in the maintained list and its associated disease.
 *
 * @param Name the name of the patient undergoing the diagnosis.
 * @param CF the highest confidence factor from the list of confidence factors.
 * @param Index the index of the highest confidence factor.
 * @param Emergency a string specifying whether an emergency situation was discovered
 *		  during the diagnosis.
 * @param FinalString the final diagnosis of the system.
 */
finalDiagnosis(Name, CF, Index, Emergency, FinalString) :-
    /* getDiagnosis/4 is used to retrieve the diagnosis of the system. The patient's name is then
     * concatenated to the diagnosis message to build the final diagnosis to be displayed.
     */
    getDiagnosis(CF, Index, Emergency, PartialDiagnosis),
    Left = Name,
    string_concat(Left, PartialDiagnosis, FinalString).

/**
 * confidenceFactor(+CF : float, +TrueWeight : float, +NewCF : float).
 *
 * Always succeeds.
 *
 * Used to get the new confidence factor following the calculations used in MYCIN.
 *
 * @param CF the highest confidence factor from the list of confidence factors.
 * @param TrueWeight the signed weight of the symptom.
 * @param NewCF the updated confidence factor.
 */

confidenceFactor(CF, TrueWeight, NewCF) :-
    /* If CF and TrueWeight are both positive, the scenario falls under the first case
     * detailed in MYCIN, and NewWeight is computed using the pertinent formula.
     */
    CF > 0,
    TrueWeight > 0,
    NewCF is CF + TrueWeight - CF * TrueWeight.

confidenceFactor(CF, TrueWeight, NewCF) :-
    /* If CF and TrueWeight are both negative, the scenario falls under the second case
     * detailed in MYCIN, and NewWeight is computed using the pertinent formula.
     */
    CF < 0,
    TrueWeight < 0,
    NewCF is CF + TrueWeight + CF * TrueWeight.

confidenceFactor(CF, TrueWeight, NewCF) :-
    /* If CF and TrueWeight do not fall under either of the above conditions,
     * the scenario falls under the third case detailed in MYCIN, and
     * NewWeight is computed using the pertinent formula.
     */
    NewCF is (CF + TrueWeight) / (1 - min(abs(CF), abs(TrueWeight))).

/**
 * adjustedWeight(+Weight : float, +Answer : integer, +NewWeight : float).
 *
 * Succeeds if Answer is either 1 or 0 (semantically similar to
 * "true" and "false" respectively in this rule).
 *
 * @param Weight the unsigned weight of the symptom.
 * @param Answer signifies whether the user response is positive(1) or negative(0).
 * @param NewWeight the updated signed weight of the symptom.
 */

adjustedWeight(Weight, Answer, NewWeight) :-
    /* If the user responded positively to the inquiry, Answer is passed as 1 and the
     * signed weight remains positive.
     */
    Answer =@= 1,
    NewWeight is Weight.

adjustedWeight(Weight, Answer, NewWeight) :-
    /* If the user responded negatively to the inquiry, Answer is passed as 0 and the
     * signed weight is converted to the negative value of Weight.
     */
    Answer =@= 0,
    NewWeight is -1 * Weight.

/**
 * restore.
 *
 * Always succeeds.
 *
 * Used to restore the original state of the knowledge base when the diagnosis system is reset.
 */
restore :-
	/* The lists of symptoms for each of the diseases and the list of confidence factors are retracted.
	 * Afterwards, lists holding the original values are asserted to the knowledge base.
	 */
	retractall(addisonSymptoms(_)),
	retractall(dermatomyositisSymptoms(_)),
	retractall(hashimotoSymptoms(_)),
	retractall(multipleSclerosisSymptoms(_)),
	retractall(lupusSymptoms(_)),
	retractall(graveSymptoms(_)),
	retractall(myastheniaGravisSymptoms(_)),
	retractall(celiacSymptoms(_)),
	retractall(reactiveArthritisSymptoms(_)),
	retractall(sjogrenSymptoms(_)),
	retractall(perniciousAnemiaSymptoms(_)),
	retractall(rheumatoidArthritisSymptoms(_)),
	retractall(diabetesSymptoms(_)),
	retractall(crohnsSymptoms(_)),
	retractall(alopeciaAreataSymptoms(_)),
	retractall(cf(_)),
	asserta(addisonSymptoms([muscleWeakness, fatigue, orthoHypotension, hyperpigmentation, blackFreckles, discoloration, nausea, vomiting, diarrhea, coldSensitivity, weightLoss, dehydration])),
	asserta(dermatomyositisSymptoms([rashes, redVioletBumps, gottron, muscleWeakness, jointPain, jointSwelling, discoloredSkin, thickenedSkin])),
	asserta(hashimotoSymptoms([goiter, tiredness, weightGain, coldSensitivity, jointPain, musclePain, constipation, thinningHair, memoryProblem, slowHeartRate, irregularMenstruation])),
	asserta(multipleSclerosisSymptoms([paresthesia, clumsiness, visionLoss, muscleWeakness, vertigo, fatigue, decreasedBladderControl, shortAttentionSpan, difficultyProcessing, anxiety, constipation, difficultyChewing])),
	asserta(lupusSymptoms([fatigue, jointSwelling, jointPain, headache, fever, lightSensitivity, chestPain, butterflyRash, hairLoss, mouthSores, raynaud, abdominalPain])),
	asserta(graveSymptoms([irregularHeartbeat, diarrhea, goiter, heatSensitivity, irritable, muscleWeakness, fatigue, tremblingHands, difficultySleeping, weightLoss, bulgingEyes, doubleVision, eyeSwelling])),
	asserta(myastheniaGravisSymptoms([droopingEyelid, doubleVision, difficultyFacialExpression, difficultyChewing, difficultySwallowing, slurredSpeech, muscleWeakness, difficultyBreathing])),
	asserta(celiacSymptoms([abdominalBloating, abdominalPain, constipation, diarrhea, weightLoss, paleStool, skinRashBlister, mouthSores, jointPain, failureToThrive, legTingling, irregularMenstruation])),
	asserta(reactiveArthritisSymptoms([jointPain, heelPain, backPain, conjunctivitis, eyePain, blurredVision, painfulUrination, frequentUrination, fever, fatigue, hairLoss, mucocutaneousLesion, keratomadermaBlennorrhagicum])),
	asserta(sjogrenSymptoms([dryEyes, dryMouth, difficultyChewing, difficultySwallowing, raynaud, fatigue, vaginalDryness, musclePain, jointPain,swollenSalivaryGland, rashes])),
	asserta(perniciousAnemiaSymptoms([fatigue, shortnessOfBreath, dizziness, headache, chestPain, legTingling, muscleWeakness, balanceLoss, nausea, vomiting, constipation, diarrhea, appetiteLoss, weightLoss, redTongue])),
	asserta(rheumatoidArthritisSymptoms([jointPain, jointStiffness, jointSwelling, bilateralJointProblem, weightLoss, fever, fatigue, muscleWeakness])),
	asserta(diabetesSymptoms([thirst, frequentUrination, fatigue, weightLoss, oralThrush, blurredVision, persistentCut])),
	asserta(crohnsSymptoms([abdominalPain, diarrhea, fever, appetiteLoss, weightLoss, skinTag, rectalBleeding, analFissure])),
	asserta(alopeciaAreataSymptoms([baldPatches, baldAreaItching, fingerNailIssue, hairLoss])),
	asserta(cf([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0])).
