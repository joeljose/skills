# Architecture Improvement Reference

## Friction Signals

### Shallow Modules
- **Sign**: Class has many public methods, each doing very little
- **Fix**: Consolidate into fewer, deeper methods that hide decisions
- **Example**: A `UserService` with `validateEmail()`, `validateName()`, `validateAge()` → single `validate()` that knows the rules

### Tight Coupling
- **Sign**: Changing module A requires changing modules B, C, D
- **Fix**: Introduce an interface/abstraction at the boundary. Depend on abstractions, not concretions.
- **Test**: Can you test module A without instantiating B?

### Pass-Through Methods
- **Sign**: Method does nothing except forward to another method with the same signature
- **Fix**: Either give the method real responsibility or remove the layer
- **Test**: Delete the method — does the caller need to change significantly?

### Feature Envy
- **Sign**: A method uses more data from another class than from its own
- **Fix**: Move the method to the class whose data it uses

### Leaky Abstractions
- **Sign**: Callers need to know implementation details to use the interface correctly
- **Fix**: Redesign the interface to hide the decision. The caller should never need to "know" about internal state.

### God Modules
- **Sign**: One file/class that everything depends on; it changes in every PR
- **Fix**: Identify separate responsibilities and extract into focused modules

## Deep Module Design Checklist
- [ ] Can a new developer use this module by reading only the interface?
- [ ] Does the interface hide at least one significant design decision?
- [ ] Are common operations simple (1-2 lines for the caller)?
- [ ] Does the module handle errors internally when possible?
- [ ] Could you swap the implementation without changing callers?

## Migration Strategies

### Strangler Fig
Gradually replace old code by routing new behavior through new code. Old and new coexist until migration is complete.

### Branch by Abstraction
1. Introduce an abstraction over the existing implementation
2. Move callers to use the abstraction
3. Create new implementation behind the same abstraction
4. Switch over, remove old implementation

### Parallel Implementation
Run old and new code side by side, compare outputs, switch when confident.
