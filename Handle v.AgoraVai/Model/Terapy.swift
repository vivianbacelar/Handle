//
//  Expand.swift
//  Holdy v2
//
//  Created by Alexandre César Brandão de Andrade on 26/10/22.
//

import Foundation
import SwiftUI


struct Terapy {
    var text:String
    var timetoDisplay:TimeInterval = 3
}


let terapies:[Terapy] = [
    Terapy(text: "Take a few seconds to notice how you are", timetoDisplay: 4),
    Terapy(text: "paying attention to your body sensations, areas of tension,", timetoDisplay: 5),
    Terapy(text: "areas of more or less presence…", timetoDisplay: 5),
    Terapy(text: "Movement, mobility, space.", timetoDisplay: 7),
    Terapy(text: "Slowly, place your hands facing each other with fingers pointing forward", timetoDisplay: 9),
    Terapy(text: "and feel, for a few seconds, what it's like to make that gesture.", timetoDisplay: 8),
    Terapy(text: "How much space did you leave between your hands…", timetoDisplay: 7),
    Terapy(text: "Slowly, stretch your palms as if you want to expand outward", timetoDisplay: 11),
    Terapy(text: "making a small tension in the palms, feel the effect of this", timetoDisplay: 10),
    Terapy(text: "Also, noticing if doing this you feel any change in your body", timetoDisplay: 11),
    Terapy(text: "and what's like to have your hands a little more tense", timetoDisplay: 7),
    Terapy(text: "again, stretch the palms a little more letting the fingers follow them, opening a little more, increasing the space between the fingers", timetoDisplay: 18),
    Terapy(text: "and feeling the effect of it on you.", timetoDisplay: 18),
    Terapy(text: "How is the experience of having your hands outstretched…", timetoDisplay: 7),
    Terapy(text: "what happens in the head, face, eyes, neck, throat, chest, belly, legs and feet...", timetoDisplay: 17),
    Terapy(text: "Something else in your body that intends?", timetoDisplay: 9),
    Terapy(text: "If isn’t an uncomfortable degree, increase the tension in the palms again by stretching the fingers further forward and outward,including the thumbs", timetoDisplay: 18),
    Terapy(text: "and feel the effect of that behavior, that gesture on you.", timetoDisplay: 12),
    Terapy(text: "If something follows the tension of the hands, making the same movement of tension and expansion, or doing the opposite movement,of contraction…", timetoDisplay: 10),
    Terapy(text: "How far are your arms from your body?", timetoDisplay: 5),
    Terapy(text: "Are your arms glued together or too far away from your body? Is there a distance between the arm and the body?", timetoDisplay: 13),
    Terapy(text: "Keep the tension degree, do not undo.", timetoDisplay: 5),
    Terapy(text: "Let this experience register for you.", timetoDisplay: 7),
    Terapy(text: "Body and emotional experience…", timetoDisplay: 8),
    Terapy(text: "Slowly take a small step out of the tension in your palms and fingers and wait…", timetoDisplay: 12),
    Terapy(text: "Wait feeling the difference… ", timetoDisplay: 5),
    Terapy(text: "Feeling what happens inside you, in your heart, in the breath on your face, in your head, in your jaw, in your arms and hands, in your legs and feet...", timetoDisplay: 26),
    Terapy(text: "And, when you can, slowly release some more tension in your hands, in small steps…", timetoDisplay: 13),
    Terapy(text: "and wait again, feeling your answers, feeling what happens in the hands, if there is a tingling, a flow, a wave... what happens in the feet, in the head, inside the body...", timetoDisplay: 26),
    Terapy(text: "How is the space between the hands, how is the space between the arms and the body...", timetoDisplay: 9),
    Terapy(text: "If you want to make a small adjustment to the space between your hands or between your arms and your body you can.", timetoDisplay: 10),
    Terapy(text: "and slowly, again, release a little more of tension keeping the hands still facing eatch other, but with minimal tension, very gently,", timetoDisplay: 18),
    Terapy(text: "and feel the effect of it.", timetoDisplay: 5),
    Terapy(text: "feel the effect on your hands, on your body as a whole,", timetoDisplay: 7),
    Terapy(text: "feel the effect on your emotional experience, on your breathing, on your inner spaces... its general condition.", timetoDisplay: 28),
    Terapy(text: "Calmly, organizing your hands keeping the cupped hand gesture, the pose on the legs making the outline of your personal space.", timetoDisplay: 20),
    Terapy(text: "Receive your sensations, your emotional experience, your thoughts...", timetoDisplay: 18),
    Terapy(text: "notice what you have learned in this coming and going and choose if you want to repeat the exercise one more time", timetoDisplay: 8),
    Terapy(text: "and see how you can influence your degrees of tension.", timetoDisplay: 10)
]


let trechos = ["Take a few seconds to notice how you are",
           "paying attention to your body sensations, areas of tension,",
          "areas of more or less presence…",
           "Movement, mobility, space.",
           "Slowly, place your hands facing each other with fingers pointing forward",
           "and feel, for a few seconds, what it's like to make that gesture.",
          "How much space did you leave between your hands…",
           "Slowly, stretch your palms as if you want to expand outward",
          "making a small tension in the palms, feel the effect of this",
          "Also, noticing if doing this you feel any change in your body",
          "and what's like to have your hands a little more tense",
          "again, stretch the palms a little more letting the fingers follow them, opening a little more, increasing the space between the fingers",
          "and feeling the effect of it on you.",
          "How is the experience of having your hands outstretched…",
          "what happens in the head, face, eyes, neck, throat, chest, belly, legs and feet...",
          "Something else in your body that intends?",
    "If isn’t an uncomfortable degree, increase the tension in the palms again by stretching the fingers further forward and outward,including the thumbs",
    "and feel the effect of that behavior, that gesture on you.",
       "If something follows the tension of the hands, making the same movement of tension and expansion, or doing the opposite movement,of contraction…", "How far are your arms from your body?",
       "Are your arms glued together or too far away from your body? Is there a distance between the arm and the body?",
       "Keep the tension degree, do not undo.", "Let this experience register for you.", "Body and emotional experience…", "Slowly take a small step out of the tension in your palms and fingers and wait…",
       "Wait feeling the difference… ", "Feeling what happens inside you, in your heart, in the breath on your face, in your head, in your jaw, in your arms and hands, in your legs and feet...",
       "And, when you can, slowly release some more tension in your hands, in small steps…",
               "and wait again, feeling your answers, feeling what happens in the hands, if there is a tingling, a flow, a wave... what happens in the feet, in the head, inside the body...",
               "How is the space between the hands, how is the space between the arms and the body...", "If you want to make a small adjustment to the space between your hands or between your arms and your body you can.",
               "and slowly, again, release a little more of tension keeping the hands still facing eatch other, but with minimal tension, very gently,", "and feel the effect of it.", "feel the effect on your hands, on your body as a whole,",
               "feel the effect on your emotional experience, on your breathing, on your inner spaces... its general condition.", "Calmly, organizing your hands keeping the cupped hand gesture, the pose on the legs making the outline of your personal space.", "Receive your sensations, your emotional experience, your thoughts...", "notice what you have learned in this coming and going and choose if you want to repeat the exercise one more time", "and see how you can influence your degrees of tension."
      ]

let trechos_grasp = ["Take a few seconds to notice how you are in your body",
                 "Sensations that are present, tensions...",
                 "and slowly, begin to close your hands.",
                 "Feel how you did it, if you closed your hands already making a degree of pressure or closed them gently",
                 "and its effect on you.",
                 "How is the experience of this contact with yourself…",
                 "slowly, in small steps, increase the pressure on your hands",
                 "by one degree and wait.",
                 "Feel the effect of it.",
                 "Notice if you squeezed something else in your body,",
                 "on the face, chest, shoulders, neck, legs...",
                 "and again increase the pressure on the hands a little and wait.",
                 "Wait and feel the effect, the experience in the hands, in the body as a whole.",
                 "Notice if you pressed anywhere else, and if it is pleasant or unpleasant for you",
                 "and whether it has an emotional effect",
                 "Slowly take a small step away from the pressure on your hands and wait.",
                 "and feel the effect of that behavior, that gesture on you.",
                 "When you want, undo one more small step and wait.",
                 "What happens to the hands?",
                 "Is there a pulse? A tingling, a heat?",
                 "What happens in the head, neck, throat, shoulders, chest, legs...",
                 "What is the whole body experience like?",
                 "Again, release some of the hand pressure and wait",
                 "What experience have you acquired? Has it changed you as a whole? ",
                 "How is the space between the finger and the palms?",
                 "There's a warmth, a coolness...",
                 "if you have one more degree to undo, especially on the thumbs, undo, leaving your hands very light",
                 "Feel the effect on the body as a whole, feel your emotional experience.",
                 "Try opening your hands very slowly, making a small expansion with your hand slowly.",
                 "Fingers will be a little stiff, but that's okay.",
                 "Experiencing how far you want to open your hands, take it easy",
                 "and at the end, with cupped hands, make your personal outline in front of you,",
                 "choosing how far you want to organize your hands from each other and how far they are from the body…",
                 "notice if you left your arms too close to your body and if you want to increase the space or keep them that way.",
                 "If you want, you can redo the practice waiting just 10 seconds to start over.",
                 ]

//let ind = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39]
