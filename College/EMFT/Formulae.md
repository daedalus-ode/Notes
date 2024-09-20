# Unit 1
## Line charge
$$E = \frac{-\rho_L}{4\pi\epsilon_o\rho}\int_{\alpha_1}^{\alpha_2}{[cos(\alpha) a_p+sin(\alpha)a_z]d\alpha}$$
Where $\alpha_1$ and $\alpha_2$ are angles that the line subtends to the point
- Infinite line charge - $$E = \frac{\rho_L}{2\pi\epsilon_o\rho}a_p$$
## Surface charge
Electric field due to surface charge is
$$E = \int_S \frac{\rho_sdS}{4\pi\varepsilon_0R^2}a_R$$
Substituting $dS \rightarrow \rho\ d\phi\ d\rho$ and solving
$$E = \frac{\rho_s}{2\epsilon_0}a_n$$
Where $a_n$ is unit vector perpendicular to sheet
## Volume charge
Electric field due to volume charge is
$$E = \int_S \frac{\rho_sdV}{4\pi\varepsilon_0R^2}a_R$$
With $a_R = cos(\alpha) a_Z - sin(\alpha) a_p$
$$E = \frac{Q}{4\pi \varepsilon_o} z^2$$
$$Q = \rho_v \frac{4}{3}\pi a^3$$
## Electric Flux Density
Also known as Electric Displacement
$$D = \varepsilon_o E$$
$$\psi = \int_S D \cdot dS$$
## Divergence
$$\nabla \cdot A = lim_{\Delta v \rightarrow 0} \frac{\int_S A \cdot dS}{\Delta V}$$
### Cartesian
$$\nabla \cdot A = \frac{\partial A_x}{\partial x}+\frac{\partial A_y}{\partial y}+\frac{\partial A_z}{\partial z}$$
### Cylindrical
$$\nabla \cdot A = \frac{1}{\rho}\frac{\partial \rho A_\rho}{\partial \rho}+\frac{1}{\rho}\frac{\partial A_\phi}{\partial \phi}+\frac{\partial A_z}{\partial z}$$
### Spherical
$$\nabla \cdot A = 
\frac{1}{r^2}\frac{\partial (r^2 A_r)}{\partial r}+
\frac{1}{rsin\theta}\frac{\partial (A_\theta sin\theta)}{\partial \theta}+
\frac{1}{rsin\theta}\frac{\partial A_\phi}{\partial \phi}$$