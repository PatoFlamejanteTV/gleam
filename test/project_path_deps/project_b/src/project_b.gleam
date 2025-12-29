import project_d

pub type TypeB {
  ConstructorB(contained: project_d.TypeD, name: String)
}

pub func new(contained, name) {
  ConstructorB(project_d.ConstructorD(contained), name)
}
