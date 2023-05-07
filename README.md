# Stadium Structure & Dynamic Loads - Project

## Overleaf
https://www.overleaf.com/1768279726hwctqzdbyjbx

## YouTube
Understanding Vibration and Resonance:\\
https://www.youtube.com/watch?v=vLaFAKnaRJU&ab_channel=TheEfficientEngineer

Introduction to Mechanical Vibration:\\
https://www.youtube.com/watch?v=9_d8CQrCYUw&ab_channel=MITOpenCourseWare

## Background
When designing stadium structures, it is important to understand and control the dynamic loads that can occur due to crowd-induced vibrations. For example, during Bruce Springsteen's concert at Ullevi Stadium in Gothenburg on June 8, 1985, the rhythmic movement of the crowd caused the soft ground beneath the stadium, made of Gothenburg clay, to undergo self-excited vibration, resulting in structural damage totaling over 36 million SEK.

## Project Description
In this project, you are responsible for creating a simplified mathematical model of a stadium seating structure and analyzing its response to a popular football chant. A preliminary study has shown that a seating structure can be modeled as a single degree of freedom system with mass $M$, stiffness $k$, and damping $c$. When a person with mass $m$ stands on the seating structure, the combined mass of the person and the structure creates a displacement $\delta$. Assume that the person starts swaying with a frequency $f$, exerting a periodic force proportional to their weight with a proportionality constant $\alpha$.

1. Derive the force equation for the above model, determine the steady-state response, and find the amplification factor $M$.

2. Assume the following parameter values: $M = 1000$ kg; a person with mass $m = 75$ kg, $\alpha = 0.3$, $\delta = 5$ cm, and $c = 2500$ Ns/m. Choose a typical frequency for a football chant. Create a MATLAB function and plot the dynamic response of the structure. How does it compare to the expected static response? Describe the effect of the chant's tempo.

3. Due to safety concerns, it was decided that the amplitude of the forced vibration should not exceed $1.5$ mm. How should the stiffness of the structure be changed to meet this requirement? Plot the dynamic response of the adjusted structure.

4. How can the damping factor $\zeta$ be adjusted to meet the same requirement as in 3)?

5. Create a contour plot of the maximum displacement $(\delta+X)$ as a function of hopping frequency $(f)$ and crowd size $(m)$. Discuss this plot in the context of a large football match.

## Challenges
- Write a brief literature review discussing different ways in which human excitation can be numerically modeled.
- Modify your MATLAB code to account for hopping loads.
