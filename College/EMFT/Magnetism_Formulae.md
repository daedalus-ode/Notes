# Table of Contents
- [Part 1](#part-1)
	- [Bio Savarts law](#bio-savarts-law) *
	- [Magnetic Field Intensities](#magnetic-field-intensities)
	- [Amperes Law](#amperes-law) *
		- [Applications](#applications)
			- [Infinite Line Current](#infinite-line-current)
			- [Infinite Sheet of current](#infinite-sheet-of-current) *
			- [Infinite Length Coaxial Transmission Line](#infinite-length-coaxial-transmission-line) *
				- [Hollow Cylinder](#hollow-cylinder)
				- [Solid Cylinder](#solid-cylinder)
				- [Coaxial Cable](#coaxial-cable)
			- [Toroid](#toroid)
	- [Stoke Law](#stoke-law) *
	- [Magnetic Field Density](#magnetic-field-density)
	- [Magnetic Flux](#magnetic-flux)
	- [Maxwells Equations](#maxwells-equations)
	- [Magnetic Boundary Conditions](#magnetic-boundary-conditions) *
	- [Force due to Magnetic Fields](#force-due-to-magnetic-fields) *
		- [Force on Current Element](#force-on-current-element)
		- [Force on charged particle](#force-on-charged-particle)
		- [Force between Current Elements](#force-between-current-elements)
	- [Displacment Current](#displacment-current) *
	- [Faradays Law](#faradays-law) *
		- [Stationary loop Varying magnetic Field](#stationary-loop-varying-magnetic-field)
		- [Moving loop Static magnetic Field](#moving-loop-static-magnetic-field)
		- [Moving loop varying Magnetic Field](#moving-loop-varying-magnetic-field)
- [Part 2](#part-2)
	- [Phasors](#phasors)
	- [Maxwell equations](#maxwell-equations)
	- [Wave Propogation](#wave-propogation) *
		- [Lossy Dielectrics](#lossy-dielectrics)
		- [Lossless Dielectrics](#lossless-dielectrics)
		- [Good Conductors](#good-conductors)
			- [Plane Waves](#plane-waves) *
	- [Skin Effect](#skin-effect) *
	- [Wave Polarization](#wave-polarization) *
		- [Linear](#linear)
		- [Circular](#circular)
		- [Elliptical](#elliptical)

`* - Important Derivations`

# Part 1
## Bio Savarts law
### Differential
$$d\overline{H} = \frac{I}{4\pi} \frac{d\overline{L}\times\overline{r}}{|r|^3}$$
>[!note]
> #### Remember
>- Cartesian
>$$d\overline{L} = dxa_x + dya_y + dza_z$$
>- Cylindrical
>$$d\overline{L} = d\rho a_x + \rho d\phi a_\phi + dza_z$$
>- Spherical
>$$d\overline{L} = dra_r + rd\theta a_\theta + rsin(\theta)d\phi a_\phi$$

## Magnetic Field Intensities
### Line Segment
$$\overline{H} = \frac{I}{4\pi \rho} (cos(\alpha_1)+cos(\alpha_2))a_\phi$$

$$\overline{H} = \frac{I}{4\pi \rho} \frac{2L}{\sqrt{l^2 +4\rho ^2}} a_\phi$$
### Circular coil
$$\overline{H} = \frac{I \rho^2}{2(\rho^2 + h^2)^{\frac{3}{2}}} a_z$$
### Solenoid
$$\overline{H} = nI a_y$$
## Amperes Law
$$\oint \overline{H} \cdot d\overline{l} = I_{enclosed} = \int_S \overline{J} \cdot d \overline{S}$$

$$\nabla \times \overline{H} = \overline{J}$$
### Applications
#### Infinite Line Current
$$\overline{H} = \frac{I}{2\pi \rho}a_\phi$$
#### Infinite Sheet of current
$$\overline{H} = \pm\frac{k}{2} \times a_n$$
#### Infinite Length Coaxial Transmission Line
##### Hollow Cylinder
$$\overline{H} = 0\ ;\ \rho < a$$

$$\overline{H} = \frac{I}{2\pi \rho} a_\phi\ ;\ \rho > a$$
##### Solid Cylinder
$$\overline{H} = \frac{I \rho}{2\pi a^2} a_\phi\ ;\ \rho < a$$

$$\overline{H} = \frac{I}{2\pi \rho} a_\phi\ ;\ \rho > a$$
##### Coaxial Cable
$$\overline{H} = \frac{I \rho}{2\pi a^2} a_\phi\ ;\ \rho < a$$

$$\overline{H} = \frac{I}{2\pi \rho} a_\phi\ ;\ a \le\rho \le b$$

$$\overline{H} = \frac{I}{2\pi \rho}\ [1- \frac{\rho^2 - b^2}{r_1^2 - b^2}]\  a_\phi\ ;\ b \le\rho \le r_1$$

$$\overline{H} = 0\ ;\ \rho > r_1$$
#### Toroid
$$\overline{H} = 0\ ;\ \rho < \rho_o -a$$

$$\overline{H} = \frac{NI}{2\pi \rho}\ ;\ \rho_o - a <\rho < \rho_o + a$$

$$\overline{H} = 0\ ;\ \rho > \rho_0 + a$$
## Stoke Law
$$\oint \overline{H} \cdot d\overline{l} = \int_S (\nabla \times \overline{H}) \cdot d\overline{S}$$
## Magnetic Field Density
$$\overline{B} = \mu \overline{H}$$
## Magnetic Flux
$$\Psi = \int_S \overline{B} \cdot d \overline{S}$$
## Displacment Current
$$\overline{J_d} = \varepsilon \frac{d\overline{E}}{dt}$$
## Maxwells Equations

| Name                               | Integral Form                                                                        | Point Form                                                                           |
| ---------------------------------- | ------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------ |
| Ampere's Law                       | $$\oint \overline{H} \cdot d\overline{l} = \int_S \overline{J} \cdot d\overline{S}$$ | $$\nabla \times \overline{H} = \overline{J} + \varepsilon \frac{d\overline{E}}{dt}$$ |
| Gauss' Law                         | $$\oint \overline{D} \cdot d \overline{S} = \int_V \rho_v dV$$                       | $$\nabla \cdot \overline{E} = \frac{\rho_v}{\varepsilon}$$                           |
| None Existence of magnetic dipoles | $$\oint_S \overline{B} \cdot d \overline{S} = 0$$                                    | $$\nabla \cdot \overline{B} = 0$$                                                    |
| Faraday's Law                      | $$\int \overline{E} \cdot d\overline{l} = 0$$                                        | $$\nabla \times \overline{E} = -\frac{d\overline{B}}{dt}$$                           |
## Magnetic Boundary Conditions
$$\mu_1 \overline{H}_{1n} = \mu_2 \overline{H}_{2n}\ \leftarrow or\rightarrow\ \overline{B}_{1n} = \overline{B}_{2n}$$

$$H_{1t} - H_{2t} = k$$

### Refraction
$$\frac{tan(\theta_1)}{tan(\theta_2)} = \frac{\mu_1}{\mu_2}$$

>[!Note]
>$\theta$ wrt to normal to plane
## Force due to Magnetic Fields
$$F = I\overline{L} \times \overline{B}$$

$$\overline{F} = Q \overline{u} \times \overline{B}$$
### Force on Current Element
$$d\overline{F} = Id\overline{l} \times \overline{B}$$

$$d\overline{F} = \overline{K}\ d\overline{S} \times \overline{B}$$

$$d\overline{F} = \overline{J}\ d\overline{V} \times \overline{B}$$
### Force on charged particle
- Lorentz Force Equation

$$\overline{F} = Q(\overline{E} + \overline{u} \times \overline{B})$$
### Force between Current Elements
$$\overline{F}_1 = -\overline{F}_2 = \frac{\mu_o I_1 I_2}{4\pi} \int_{l1} \int_{l2} \frac{dl_1 \times (dl_2 \times a_{R_{21}})}{{|\overline{R_{21}}|}^2}$$
## Faradays Law
$$V_{emf} = \frac{-Nd\Psi}{dt} = \oint \overline{E}d\overline{l}$$
### Stationary loop Varying magnetic Field
$$V_{emf} = \oint \overline{E} \cdot d\overline{l} = -\int_S \frac{d\overline{B}}{dt} \cdot d\overline{S}$$
- $V_{emf} \rightarrow$ Transformer EMF
### Moving loop Static magnetic Field
$$V_{emf} = \oint \overline{E} \cdot d\overline{l} = \oint_L (\overline{u} \times \overline{B})\cdot d\overline{l}$$

- Using Stokes Theorem
$$\nabla \times \overline{E} = \nabla \times(\overline{u} \times \overline{B})$$
### Moving loop varying Magnetic Field
$$V_{emf} = \oint \overline{E} \cdot d\overline{l} = -\int_S \frac{d\overline{B}}{dt} \cdot d\overline{S}\ +\ \oint_L (\overline{u} \times \overline{B})\cdot d\overline{l}$$

---
# Part 2
## Phasors
$$z = a + ib \rightarrow r\angle \theta = re^{j\theta}$$

$$X = cos(\omega t - \beta x) = Re\{\overline{X}_oe^{J\omega t}\}$$

- We can define the phasor $X_s$ such that

$$\overline{X} (x,y,z,t) = Re\{\overline{X}_s(x,y,z)\ e^{J\omega t}\}$$
## Maxwell equations

| Name                               | Phasor Form                                                               |
| ---------------------------------- | ------------------------------------------------------------------------- |
| Ampere's Law                       | $$\nabla \times \overline{H}_s = \overline{J}_s + j\omega\overline{D}_s$$ |
| Gauss' Law                         | $$\nabla \cdot \overline{E}_s = \frac{\rho_v}{\varepsilon}$$              |
| None Existence of magnetic dipoles | $$\nabla \cdot \overline{B}_s = 0$$                                       |
| Faraday's Law                      | $$\nabla \times \overline{E}_s = -J\omega \overline{B}_s$$                |
## Wave Propagation #todo
- General Wave Equation:
$$\frac{d^2X}{dt^2} - u^2 \nabla^2X = 0$$

- Or
$$\frac{d^2E}{dt^2} - \frac{1}{\mu \varepsilon} \nabla^2E = 0$$

- Solution to Wave Equation:
$$X\ (x,y,z,t)= A_o e^{-\alpha x} cos (\omega t -\beta x) =\ Re\{\overline{X}_s(x,y,z)\ e^{J\omega t}\}$$

$$\beta = \frac{\omega}{u} = \frac{2\pi}{\lambda}$$
### Lossy Dielectrics
- Wave Equation:
$$\nabla^2\ \overline{E}_s\ -\ \gamma^2\ \overline{E}_s = 0$$

#### $\gamma$ - Propagation constant
$$\gamma = \sqrt{J\omega\mu(\sigma+j\omega\varepsilon)}$$

- $\gamma = \alpha + j\beta$
#### $\alpha$ - Attenuation constant
$$\alpha = \omega \sqrt{\frac{\mu\varepsilon}{2}\Bigg[\sqrt{1+(\frac{\sigma}{\omega\epsilon})^2}-1 \Bigg] }$$
#### $\beta$ - Phase shift constant
$$\beta = \omega \sqrt{\frac{\mu\varepsilon}{2}\Bigg[\sqrt{1+(\frac{\sigma}{\omega\epsilon})^2}+1 \Bigg] }$$

$$\beta = \frac{\omega \mu \sigma}{2\alpha}$$
#### $\eta$ - Intrinsic Impedance
$$\eta = \sqrt{\frac{J\omega\mu}{\sigma + J\omega\varepsilon}}$$

$$\eta = |\eta|e^{J\theta_\eta}$$

$$|\eta| = \frac{\sqrt{\frac{\mu}{\varepsilon}}}{\Big[1+{(\frac{\sigma}{\omega\varepsilon})}^2\Big]^{\frac{1}{4}}}$$
#### $\theta_{\eta}$ - Phase
$$\theta_{\eta} = \frac{1}{2}tan^{-1}\big(\frac{\sigma}{\omega\varepsilon}\big)$$
>[!note]
>- $\overline{E}$ leads $\overline{H}$ by angle $\theta_{\eta}$
>- $\overline{H}$ lags $\overline{E}$ by angle $\theta_{\eta}$

### Plane Waves in Free Space
- We know that $\gamma^2 = J\omega\mu(\sigma + J\omega\varepsilon)$
- For free space $\sigma = 0$, therefore:
$$\gamma = J\omega \sqrt{\mu_o\varepsilon_o}$$

- $\alpha = 0$, therefore **no attenuation**
$$\beta = \omega \sqrt{\mu_o \varepsilon_o} = \frac{\omega}{c}$$

- $\eta_o = \sqrt{\frac{\mu_o}{\varepsilon_o}} = 120\pi$
- $\overline{E}$ and $\overline{H}$ are in phase
### Lossless Dielectrics
- For free space $\sigma = 0$, therefore:
$$\gamma = J\omega \sqrt{\mu\varepsilon}$$

- And $\eta = \sqrt{\frac{\mu}{\varepsilon}}$
- And $\beta = \omega\sqrt{\mu\varepsilon}$, therefore:
$$c = \frac{1}{\sqrt{\mu_o\mu_r\varepsilon_o\varepsilon_r}}$$

### Good Conductors
#### Plane Waves
## Skin Effect
- Skin depth / penetration is the distance travelled by EM wave getting attenuated by a factor e
$$\delta = \frac{1}{\alpha}$$

- For good conductors,
$$\delta = \frac{1}{\sqrt{\pi\rho\mu\sigma}}$$

- $\delta$ is very small for good conductors $\therefore$ waves dies down at high rate
- Very high frequency (RF range) comes from good conductors, $\delta$ is small at high frequency $\therefore$ **Skin effect**
## Wave Polarization
### Linear
$$E_x = E_{ox} cos(\omega t - \beta z)$$

$$E_y = E_{oy} cos(\omega t - \beta z)$$

$$z = 0$$

$$\Delta \phi = \phi_y - \phi_x = 0$$

$$E_{ox} = E_{oy} \rightarrow \theta = 45^o$$

$$E_{ox} \neq E_{oy} \rightarrow \theta = tan^{-1}\Big(\frac{E_{oy}}{E_{ox}}\Big)$$
### Circular
$$E_x = E_{ox} cos(\omega t - \beta z)$$

$$E_y = E_{oy} cos(\omega t - \beta z - \frac{\pi}{2})$$

$$E_{ox} = E_{oy}$$

$$\Delta \phi = \phi_y - \phi_x = \frac{\pi}{2}$$
### Elliptical
$$E_x = E_{ox} cos(\omega t - \beta z)$$

$$E_y = E_{oy} sin(\omega t - \beta z)$$

$$E_{ox} \ne E_{oy}$$

$$\Delta \phi = \phi_y - \phi_x = \frac{\pi}{2}$$

$${\Big(\frac{E_x}{E_{ox}}\Big)}^2 + {\Big(\frac{E_y}{E_{oy}}\Big)}^2 = 1$$
## Poynting Theorem
$$\overline{P} = \overline{E} \times \overline{H}$$

- For perfect dielectric: 
$$E_x = E_{ox} cos(\omega t - \beta z)$$

$$H_y = \frac{E_{ox}}{\eta} cos(\omega t - \beta z)$$

- Power density:
$$P_z = \frac{E^2_{ox}}{\eta} cos^2(\omega t - \beta z)$$

- For lossy dielectric, power density in phasor form
$$<P_z> = \frac{1}{2}\frac{E^2_{ox}}{|\eta|}\ e^{-2az} cos \theta_\eta$$