import 'package:flutter/material.dart';

class Course {
  String title;
  String description;
  Map<String,List<String>> chaps;

  Course({
    required this.title,
    required this.description,
    required this.chaps,
  });
}

List<Course> courseData = [
  Course(
      title: 'JEE/NEET Preparation Videos',
      description: 'Gain knowledge and tricks for competitive exams.',
      chaps: {"JEE/NEET Preparation" : [
        "Hyperconjugation Effect - GOC	\nhttps://www.youtube.com/watch?v=5TzVm7jMjBo&list=PLiXvw2G9IEJCHONHPEdT5Df5N-EDHL4IG&index=30"
            "Types Of Reagents	\nhttps://www.youtube.com/watch?v=Eyr6XAeN_-Y&list=PLiXvw2G9IEJCHONHPEdT5Df5N-EDHL4IG&index=31"
            "Inductive Effect	\nhttps://www.youtube.com/watch?v=ILwYoa0UVy8&list=PLiXvw2G9IEJCHONHPEdT5Df5N-EDHL4IG&index=32"
            "Carbocations	\nhttps://www.youtube.com/watch?v=tfVYEAEFjTo&list=PLiXvw2G9IEJCHONHPEdT5Df5N-EDHL4IG&index=33"
            "Carbanions	\nhttps://www.youtube.com/watch?v=ZpmASia-MFc&list=PLiXvw2G9IEJCHONHPEdT5Df5N-EDHL4IG&index=34"
            "Substitution Reactions	\nhttps://www.youtube.com/watch?v=8eJQMroYJ5k&list=PLiXvw2G9IEJCHONHPEdT5Df5N-EDHL4IG&index=35"
            "Freeradicals	\nhttps://www.youtube.com/watch?v=a6pYzpJS2xU&list=PLiXvw2G9IEJCHONHPEdT5Df5N-EDHL4IG&index=36"
            "Addition Reactions	\nhttps://www.youtube.com/watch?v=0zxgOWhfI6M&list=PLiXvw2G9IEJCHONHPEdT5Df5N-EDHL4IG&index=37"

      ]}
  ),
    Course(
      title: 'Grade 9: Foundations of Chemistry, NCERT IGCSE',
      description: 'An introduction to the fundamental concepts of matter, atomic structure, the periodic table, and basic chemical bonding.',
      chaps: {"" : []}
    ),
    Course(
      title: 'Grade 10: Chemical Reactions & Stoichiometry, NCERT IGCSE',
      description: 'Explore different types of chemical reactions, learn to balance equations, and master the calculations of chemical quantities.',
chaps: {"Acids Bases and Salts" : [
  "Acids, Bases and Salts - Basics	\nhttps://www.youtube.com/watch?v=e7UYVUH0BTg&list=PLiXvw2G9IEJDgM0__yRmhtTWGCtZfTr5Z&index=1",],
    "Carbon and its Compounds":[
    "Carbon and its compounds - Revision for Board exam Part -1	\nhttps://youtu.be/ZxpTrYeubu0?list=PL5eHH9Ruwtz10CyUAlqzRnvGSPbh_h1C0",


    ]}
    ),
    Course(
      title: 'Grade 11: Chemistry',
      description: 'A deep dive into periodic trends, advanced bonding theories, thermodynamics, kinetics, and chemical equilibrium.',
   chaps: {"Thermodynamics" : ["https://youtu.be/1i6mBQyh9W8?list=PLiXvw2G9IEJCXhIUm6NK5qG-SFx8hUZ_t","https://youtu.be/1i6mBQyh9W8?list=PLiXvw2G9IEJCXhIUm6NK5qG-SFx8hUZ_t","https://youtu.be/spDKwaJQe9s?list=PLiXvw2G9IEJCXhIUm6NK5qG-SFx8hUZ_t",
     "https://www.youtube.com/watch?v=5XYqTRcyAEU&list=PLiXvw2G9IEJCXhIUm6NK5qG-SFx8hUZ_t&index=3",],
     "Chemical Bonding" : ["https://www.youtube.com/watch?v=UgwgPRfiyRk&list=PLiXvw2G9IEJCHONHPEdT5Df5N-EDHL4IG&index=2"],
     "GOC" :
     ["IUPAC nomenclature	\nhttps://youtu.be/lWIGHVKLkKs?list=PLiXvw2G9IEJCHONHPEdT5Df5N-EDHL4IG\n"
    "Ring Expansion Part 2	\nhttps://www.youtube.com/watch?v=AE_nJdq_zE8&list=PLiXvw2G9IEJCHONHPEdT5Df5N-EDHL4IG&index=4\n"
    "Ring Expansion Part 1	\nhttps://www.youtube.com/watch?v=x0Ii_di8JOs&list=PLiXvw2G9IEJCHONHPEdT5Df5N-EDHL4IG&index=5\n"
    "Free Radical Reaction Problems-1	\nhttps://www.youtube.com/watch?v=IuDZLy1UmKY&list=PLiXvw2G9IEJCHONHPEdT5Df5N-EDHL4IG&index=6\n"
    "Free Radical Reactions	\nhttps://www.youtube.com/watch?v=mA2ZYY4Ril4&list=PLiXvw2G9IEJCHONHPEdT5Df5N-EDHL4IG&index=7\n"
    "Organic Reaction Mechanism Part 1	\nhttps://www.youtube.com/watch?v=X8PgFXXRWws&list=PLiXvw2G9IEJCHONHPEdT5Df5N-EDHL4IG&index=8\n"
    "How to draw the resonance structures	\nhttps://www.youtube.com/watch?v=aqJJ-3yVwjM&list=PLiXvw2G9IEJCHONHPEdT5Df5N-EDHL4IG&index=9\n"
    "Wurtz Reaction	\nhttps://www.youtube.com/watch?v=mVOGSOUiN9o&list=PLiXvw2G9IEJCHONHPEdT5Df5N-EDHL4IG&index=10\n"
    "Electrophilic substitution in Benzene Part-2	\nhttps://www.youtube.com/watch?v=FfycaciFPlg&list=PLiXvw2G9IEJCHONHPEdT5Df5N-EDHL4IG&index=11\n"
    "Electrophilic substitution in Benzene Part-1	\nhttps://www.youtube.com/watch?v=tF8gCuaJYZU&list=PLiXvw2G9IEJCHONHPEdT5Df5N-EDHL4IG&index=12\n"
    "Cis trans Isomerism	\nhttps://www.youtube.com/watch?v=qpNdQSj5ba8&list=PLiXvw2G9IEJCHONHPEdT5Df5N-EDHL4IG&index=13\n"
    "Hybridisation of carbon	\nhttps://www.youtube.com/watch?v=dNNG0eezZi8&list=PLiXvw2G9IEJCHONHPEdT5Df5N-EDHL4IG&index=14\n"
    "How to draw Resonance Structures Of Nitrobenzene explained in tamil ?	\nhttps://www.youtube.com/watch?v=6drAZfJBfe4&list=PLiXvw2G9IEJCHONHPEdT5Df5N-EDHL4IG&index=15\n"
    "How to draw Resonance structures of phenol explained in tamil ?	\nhttps://www.youtube.com/watch?v=9ZzEFcqX3ZY&list=PLiXvw2G9IEJCHONHPEdT5Df5N-EDHL4IG&index=16\n"
    "Wurtz Reaction Part 1 (explained in tamil)	\nhttps://www.youtube.com/watch?v=gVlvB3SJzhI&list=PLiXvw2G9IEJCHONHPEdT5Df5N-EDHL4IG&index=17\n"
    "Isomerism Part 1	\nhttps://www.youtube.com/watch?v=Q1jBTa5LDWY&list=PLiXvw2G9IEJCHONHPEdT5Df5N-EDHL4IG&index=18\n"
    "Inductive Effect Part 1 (explained in tamil)	\nhttps://www.youtube.com/watch?v=7HrmfHKfSaI&list=PLiXvw2G9IEJCHONHPEdT5Df5N-EDHL4IG&index=19\n"
    "Inductive Effect Part 2 (explained in tamil)	\nhttps://www.youtube.com/watch?v=enFXXWH100E&list=PLiXvw2G9IEJCHONHPEdT5Df5N-EDHL4IG&index=20\n"
    "Resonance Structures of benzaldehyde -मर्विन स्केच	\nhttps://www.youtube.com/watch?v=1HbzL-79Ino&list=PLiXvw2G9IEJCHONHPEdT5Df5N-EDHL4IG&index=23\n"
    "How to draw the Resonance structures of Phenol ?	\nhttps://www.youtube.com/watch?v=QGQBKjyoo3M&list=PLiXvw2G9IEJCHONHPEdT5Df5N-EDHL4IG&index=24\n"
    "Isomerism Part 1	\nhttps://www.youtube.com/watch?v=Q1jBTa5LDWY&list=PLiXvw2G9IEJCHONHPEdT5Df5N-EDHL4IG&index=26\n"
    ],
     "Some Basic Concepts of Chemistry" : [
       "LAW OF MULTIPLE PROPORTIONS 1	\nhttps://youtu.be/ls7NrDxhmfU?list=PLiXvw2G9IEJCaFu7r9Kgp2XZpQOqBNc8Z\n"
       "LAW OF RECIPROCAL PROPORTIONS 2	\nhttps://www.youtube.com/watch?v=-fnbhVO3E98&list=PLiXvw2G9IEJCaFu7r9Kgp2XZpQOqBNc8Z&index=2\n"
       "Limiting Reagent concept 2	\nhttps://www.youtube.com/watch?v=U6KI62uP_88&list=PLiXvw2G9IEJCaFu7r9Kgp2XZpQOqBNc8Z&index=3\n"
       "LAW OF RECIPROCAL PROPORTIONS 1	\nhttps://www.youtube.com/watch?v=VIPzPnfyrGk&list=PLiXvw2G9IEJCaFu7r9Kgp2XZpQOqBNc8Z&index=4\n"
       "Limiting Reagent concept 1	\nhttps://www.youtube.com/watch?v=pfgt_qt3W9s&list=PLiXvw2G9IEJCaFu7r9Kgp2XZpQOqBNc8Z&index=5\n"
       "Law of Multiple Proportions 1	\nhttps://www.youtube.com/watch?v=TIlF4P38ud0&list=PLiXvw2G9IEJCaFu7r9Kgp2XZpQOqBNc8Z&index=6\n"
       "Mole Concept -Basics	\nhttps://www.youtube.com/watch?v=h0a97oIh8ps&list=PLiXvw2G9IEJCaFu7r9Kgp2XZpQOqBNc8Z&index=7\n"
       "Normality, Molarity, Molality - definitions and problems	\nhttps://www.youtube.com/watch?v=2UCyjE3DGM0&list=PLiXvw2G9IEJCaFu7r9Kgp2XZpQOqBNc8Z&index=8\n"
       "Mole concept Part 1 (explained in tamil)	\nhttps://www.youtube.com/watch?v=WDHhOOjyDPs&list=PLiXvw2G9IEJCaFu7r9Kgp2XZpQOqBNc8Z&index=10\n"
       "Mole Concept part 2 (explained in tamil)	\nhttps://www.youtube.com/watch?v=VTgXzanWDWY&list=PLiXvw2G9IEJCaFu7r9Kgp2XZpQOqBNc8Z&index=11\n"

     ]
      }
    ),
    Course(
      title: 'Grade 12: Chemistry',
      description: 'Discover the world of carbon compounds. Learn about hydrocarbons, functional groups, and the mechanisms of basic organic reactions.',
chaps: {"Halo Alkanes and Halo Arenes" : [
  "HAHA-1	\nhttps://www.youtube.com/watch?v=etzobAv_opA&list=PLiXvw2G9IEJBIXz0HlgFgwbxVia8KiqqC&index=1\n"
  "SN2 Reaction-HAHA	\nhttps://www.youtube.com/watch?v=CLSXM_kGoaY&list=PLiXvw2G9IEJBIXz0HlgFgwbxVia8KiqqC&index=2\n"
  "Class 12 Board Exam Prepn TIPS	\nhttps://www.youtube.com/watch?v=K-c1vUng-BU&list=PLiXvw2G9IEJBIXz0HlgFgwbxVia8KiqqC&index=4\n"
  "SN1 & E1 Reactions	\nhttps://www.youtube.com/watch?v=BYE2TS-nGWo&list=PLiXvw2G9IEJBIXz0HlgFgwbxVia8KiqqC&index=5\n"
  "How to predict product in an organic chemistry reaction ?-Part-1	\nhttps://www.youtube.com/watch?v=PjCrWB2pPE4&list=PLiXvw2G9IEJBIXz0HlgFgwbxVia8KiqqC&index=6\n"
  "HAHA TEXT Q-A Revision-Part-3	\nhttps://youtu.be/NrJevmRluvc?list=PL5eHH9Ruwtz2nB3Qc996WUE81edQ_6kDp\n"
  "HAHA TEXT BACK Q-A Part-5	\nhttps://youtu.be/CfQ8_g53kCE?list=PL5eHH9Ruwtz2nB3Qc996WUE81edQ_6kDp\n"
  "HAHA TEXT back Q-A Part-4	\nhttps://youtu.be/NCxmoUmJLLc?list=PL5eHH9Ruwtz2nB3Qc996WUE81edQ_6kDp\n"
  "HAHA TEXT Q-A Revision-2	\nhttps://youtu.be/Fe3xe2Hh-i8?list=PL5eHH9Ruwtz2nB3Qc996WUE81edQ_6kDp\n"
  "HAHA TEXT BACK Q-A Revision-Part-1	\nhttps://youtu.be/EELmLs-y1ro?list=PL5eHH9Ruwtz2nB3Qc996WUE81edQ_6kDp\n"
  "E1 Rxn Features	\nhttps://youtu.be/zcOtLIkk0gI?list=PL5eHH9Ruwtz2nB3Qc996WUE81edQ_6kDp\n"
  "E1 Rxn Definition	\nhttps://www.youtube.com/watch?v=suUdA6vs2pI&list=PL5eHH9Ruwtz2nB3Qc996WUE81edQ_6kDp&index=7\n"
  "SN2 Reaction	\nhttps://youtu.be/6RC9dsgJPpo?list=PL5eHH9Ruwtz2nB3Qc996WUE81edQ_6kDp\n"
  "SN2 Exercises	\nhttps://youtu.be/wzSlUWRjUNY?list=PL5eHH9Ruwtz2nB3Qc996WUE81edQ_6kDp\n"
  "Aryl Halides Rxns	\nhttps://youtu.be/HJCRPUpuPyg?list=PL5eHH9Ruwtz2nB3Qc996WUE81edQ_6kDp\n"
  "WR GR Reactions	\nhttps://youtu.be/FyZu9099M0M?list=PL5eHH9Ruwtz2nB3Qc996WUE81edQ_6kDp\n"
  "Reactions of GR	\nhttps://youtu.be/kj-byP5641I?list=PL5eHH9Ruwtz2nB3Qc996WUE81edQ_6kDp\n"
  "HAHA SN1	\nhttps://youtu.be/LSw4bKNCVY0?list=PL5eHH9Ruwtz2nB3Qc996WUE81edQ_6kDp\n"
  "HAHA SN2 Reaction	\nhttps://youtu.be/L7djyS-KesI?list=PL5eHH9Ruwtz2nB3Qc996WUE81edQ_6kDp\n"

]}
    ),
    Course(
      title: 'Advanced Placement (AP) Chemistry Prep',
      description: 'A rigorous, college-level course designed to prepare students for the AP Chemistry exam, covering all major topics in-depth.',
   chaps: {"AP Preparation" : [
     "Hyperconjugation Effect - GOC	\nhttps://www.youtube.com/watch?v=5TzVm7jMjBo&list=PLiXvw2G9IEJCHONHPEdT5Df5N-EDHL4IG&index=30\n"
         "Types Of Reagents	\nhttps://www.youtube.com/watch?v=Eyr6XAeN_-Y&list=PLiXvw2G9IEJCHONHPEdT5Df5N-EDHL4IG&index=31\n"
         "Inductive Effect	\nhttps://www.youtube.com/watch?v=ILwYoa0UVy8&list=PLiXvw2G9IEJCHONHPEdT5Df5N-EDHL4IG&index=32\n"
         "Carbocations	\nhttps://www.youtube.com/watch?v=tfVYEAEFjTo&list=PLiXvw2G9IEJCHONHPEdT5Df5N-EDHL4IG&index=33\n"
         "Carbanions	\nhttps://www.youtube.com/watch?v=ZpmASia-MFc&list=PLiXvw2G9IEJCHONHPEdT5Df5N-EDHL4IG&index=34\n"
         "Substitution Reactions	\nhttps://www.youtube.com/watch?v=8eJQMroYJ5k&list=PLiXvw2G9IEJCHONHPEdT5Df5N-EDHL4IG&index=35\n"
         "Freeradicals	\nhttps://www.youtube.com/watch?v=a6pYzpJS2xU&list=PLiXvw2G9IEJCHONHPEdT5Df5N-EDHL4IG&index=36\n"
         "Addition Reactions	\nhttps://www.youtube.com/watch?v=0zxgOWhfI6M&list=PLiXvw2G9IEJCHONHPEdT5Df5N-EDHL4IG&index=37\n"

   ]}
    ),
];
