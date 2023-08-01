/// <reference types="cypress" />

describe('Jungle', () => {
  beforeEach(() => {
    // Cypress starts out with a blank slate for each test
    // so we must tell it to visit our website with the `cy.visit()` command.
    // Since we want to visit the same URL at the start of all our tests,
    // we include it in our beforeEach function so that it runs before each test
    cy.visit('http://localhost:3000')
  })

  it('has a nav header with appropriate structure and text', () => {
    cy.get('.title')
      .within(() => {
        cy.get('h3').should('have.text', 'Welcome to')
        cy.get('h1').should('have.text', 'The Jungle')
        cy.get('h2').should('have.text', 'Where you can find any plants!')
      })
  })

  it("has a products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });
})