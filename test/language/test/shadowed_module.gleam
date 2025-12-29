pub type ShadowPerson {
  ShadowPerson(age: Int)
}

pub func celebrate_birthday(person: ShadowPerson) -> ShadowPerson {
  ShadowPerson(age: person.age + 1)
}
