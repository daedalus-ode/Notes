# Table of Content
- [Unit 1](#unit-1)
- [Unit 2](#unit-2)
# Unit 1
## Point charge
$$D = \frac{Q}{4\pi r^2}a_r$$
## Line charge
$$E = \frac{-\rho_L}{4\pi\epsilon_o\rho}\int_{\alpha_1}^{\alpha_2}{[cos(\alpha) a_p+sin(\alpha)a_z]d\alpha}$$<br>
Where $\alpha_1$ and $\alpha_2$ are angles that the line subtends to the point
- Infinite line charge - <br>$$E = \frac{\rho_L}{2\pi\epsilon_o\rho}a_p$$
## Surface charge
Electric field due to surface charge is <br>
$$E = \int_S \frac{\rho_sdS}{4\pi\varepsilon_0R^2}a_R$$
Substituting $dS \rightarrow \rho\ d\phi\ d\rho$ and solving for **Infinite Sheet Charge**<br>
$$E = \frac{\rho_s}{2\epsilon_0}a_n$$
Where $a_n$ is unit vector perpendicular to sheet <br>
## Volume charge
Electric field due to volume charge is <br>
$$E = \int_S \frac{\rho_sdV}{4\pi\varepsilon_0R^2}a_R$$
<br>With $a_R = cos(\alpha) a_Z - sin(\alpha) a_p$ <br>
$$E = \frac{Q}{4\pi \varepsilon_o} z^2$$
<br>$$Q = \rho_v \frac{4}{3}\pi a^3$$
## Electric Flux Density
Also known as Electric Displacement <br>
$$D = \varepsilon_o E$$<br>
$$\psi = \int_S D \cdot dS$$
## Divergence
$$\nabla \cdot A = lim_{\Delta v \rightarrow 0} \frac{\int_S A \cdot dS}{\Delta V}$$ <br> General Formula <br>
$$\nabla \cdot A = \frac{1}{h_1 h_2 h_3} [
\frac{\partial}{\partial a_1}\frac{h_2 h_3}{h_1}A+
\frac{\partial}{\partial a_2}\frac{h_1 h_3}{h_2}A+
\frac{\partial}{\partial a_3}\frac{h_1 h_2}{h_3}A]$$
### Cartesian
$$\nabla \cdot A = \frac{\partial A_x}{\partial x}+\frac{\partial A_y}{\partial y}+\frac{\partial A_z}{\partial z}$$
### Cylindrical
$$\nabla \cdot A = \frac{1}{\rho}\frac{\partial \rho A_\rho}{\partial \rho}+\frac{1}{\rho}\frac{\partial A_\phi}{\partial \phi}+\frac{\partial A_z}{\partial z}$$
### Spherical
$$\nabla \cdot A = 
\frac{1}{r^2}\frac{\partial (r^2 A_r)}{\partial r}+
\frac{1}{rsin\theta}\frac{\partial (A_\theta sin\theta)}{\partial \theta}+
\frac{1}{rsin\theta}\frac{\partial A_\phi}{\partial \phi}$$
## Divergence Theorem
$$\int_S A \cdot dS = \int_V \nabla \cdot A\ dV$$ <br> Total outward flux of a vector field through closed surface S is same as volume integral of the divergence of A
## Gauss law
$$\Psi = \int_S D \cdot dS = Q_{enclosed} = \int_V \rho_v\ dV$$<br> Applying divergence theorem <br> $$\int_S D \cdot dS  = \int_V \nabla \cdot D\ dV$$ <br>
Comparing the equations :- We get Maxwell's 1st equation<br> $$\rho_v = \nabla \cdot D$$
### Applying Gauss law
- Infinite line charge
$$\rho_L l = Q = \int_S D \cdot dS = D_\rho \int_S dS = D_\rho\ 2\pi\ \rho\ l$$<br> $$D_\rho = \frac{\rho_L l}{2\pi\ \rho\ l}\ \rightarrow\ D = \frac{\rho_L}{2\pi\ \rho}a_\rho$$
- Infinite sheet charge
$$\rho_S A = D_z(A+A) = 2D_zA$$<br>
$$D = D_z a_z = \frac{\rho_s}{2}a_z\ (or)\ E = \frac{\rho_s}{2\varepsilon_o}a_z$$
- Uniformly charged sphere
$$D = 
\begin{cases}
\frac{r}{3}\ \rho_o\ a_r & \text{if } 0 \lt r \le a\\
\frac{a^3}{3\ r^2}\ \rho_o\ a_r & \text{if } r \ge a
\end{cases}$$
## Electric Potential
$$V_{BA} = \frac{W}{Q} = - \int_A^B E \cdot dl$$ <br>
Absolute potential - work done per charge to bring it from infinity to r <br>
$$V = - \int_\infty^r E \cdot dl$$
## Relation b/w E and V
For a closed loop:- <br> $$\int_L E \cdot dl = 0$$ <br> Applying stoke's theorem <br>
 $$\int_L E \cdot dl = \int_S(\nabla \times E) \cdot dS = 0\ (or)\ \nabla \times E = 0$$ <br>
 Electric field is the gradient of V :- <br>
 $$E = -\nabla V$$
## Continuity Equation
$$I_{out} = \oint J.dS = -\frac{dQ_{in}}{dt}$$<br>
With divergence theorem :- <br>
$$\oint J.dS = \int_v \nabla . J\ dV$$ <br>
Also <br>
$$-\frac{dQ_{in}}{dt} = -\int_v \frac{\partial \rho_v}{\partial t} dV$$<br>
Therefore **Continuity Equation**<br>
$$\nabla .J = -\frac{\partial \rho_v}{\partial t}$$<br>
>[!Note]
>For DC current $\frac{\partial \rho_v}{\partial t} = 0$
>Therefore $\nabla .J =0$
## Relaxation time
$$\rho_v = \rho_{vo}\ e^{-\frac{t}{T_r}}
\text{ where } T_r = \frac{\varepsilon}{\sigma}
$$

## Poisson's Equation #todo 

## Laplace Equation #todo 

## Boundary conditions
Maxwell's Equations :-<br>
$$\oint_S \overline{D} . d\overline{S} = Q_{enc} \rightarrow 1^{st} \text{ Equation}$$ <br>
$$\oint_L \overline{E}.d \overline{l} = 0 \rightarrow 2^{nd} \text{ Equation}$$
### Dielectric - Dielectric
$$\varepsilon_1 = \varepsilon_o\ \varepsilon_{r1} \text{ (and) } \varepsilon_2 = \varepsilon_o\ \varepsilon_{r2}$$  <br>
For a closed path `abcda`. The tangential components of an electric field crossing the interface undergoes no change :- <br> $$E_{1t} = E_{2t}$$<br>
 Or <br> $$\frac{D_{1t}}{\varepsilon_1} = \frac{D_{2t}}{\varepsilon_2}$$ <br>
Similarly for cylindrical Gaussian surface $$D_{1n} - D_{2n} = \rho_s$$ <br> Or when $\rho_s = 0$<br>
$$\varepsilon_1\ E_{1n} = \varepsilon_2\ E_{2n}$$
 
### Conductor - Dielectric
### Conductor - Free space
---
# Unit 2 #todo 

