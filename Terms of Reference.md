# Terms of Reference

## Table of Contents

- [Overview](#overview)
- [Project Scope](#project-scope)
- [Purpose of the Technical Committee](#purpose-of-the-technical-committee)
- [Membership Composition](#membership-composition)
- [Project Schedule](#project-schedule)
- [Meeting Schedule](#meeting-schedule)
- [Consensus Building](#consensus-building)
- [Code of Conduct](#code-of-conduct)

## Overview

This Terms of Reference (ToR) defines the goals of the Trust Meter Technical
Specification, how it differs or relates to other specifications regarding
Artificial Intelligence (AI) and Trust, and the objectives of the Technical
Committee, outlining the roles and responsibilities of those involved.

## Project Scope

The Trust Meter Technical Specification addresses statistical discrimination
against data outliers and small minorities in mechanized statistical reasoning
in AI decision tools. The Trust Meter Technical Specification is intended to
alert AI operators when the scenario, group or individual about whom the
decision is made is out-of-distribution relative to the training set the model
is trained on, meaning the AI should not be trusted to make decisions in this
context.

## Purpose of the Committee

The overall objective of the Technical Committee is to determine how to evaluate
an AI tool's decision making algorithm when used with marginalized or outlier
individuals; that it discriminates against them. The main objective leads to
sub-goals.

The committee will develop definitions of "marginalized" and "outlier" to fully
contextualize their importance and relevance to the evaluation of an AI model. 
This will help operationalize the notion of statistical discrimination.  Some
things to consider in this regard are the reasons why an individual is deemed
marginalized or an outlier.  A possible reason, or example, is that they were
either not part of the training data or were poorly represented within it. 
Another reason might be the nature of the model or algorithm that the AI uses in
making its decisions.  That model or algorithm might producc discriminatory
results in the context of an outlier and that would indicate it is inappropriate
to use in this case.

The committee will also delineate the kinds of generative AI that are relevant
to the trust meter specification.  For example, an AI that is definitely
out-of-scope is one that generates photorealistic images of human faces. This
kind of AI is not properly described as making any decisions. However, a large
language model (LLM) may or may be in scope. Consider this scenario: An AI
decision tool is known to discriminate and it uses an LLM during its processing
to arrive at a decision.  The LLM might be the source of the discrimination;
hence the LLM is in scope in this scenario.

The committee will develop and document techniques for evaluating an AI in order
to determine whether it discriminates or can potentially discriminate.  These
techniques will allow an operator to judge whether to use the AI in a specific
context.

The above are the main objectives of the committee.  The committee, in its work,
may discover other relevant objectives, and can note them as part of the
specification.

- Includes Technical Experts who will draft the Technical Specification
  - Consider gender responsiveness when drafting the Technical Specification
  - Consider environmental responsiveness when drafting the Technical 
    Specification
  - Respond to questions/comments during review of Technical Specification
  - Technical Experts will provide guidance on whether a public or peer review
    of the Technical Specification is required
- Vote on publication of Technical Specification
- Help review Technical Specification, including providing feedback on the 
  Technical Specification, and facilitating the review process.

## Membership Composition

- Available to work in either of Canada's official languages (English and
  French).

## Project Schedule

### Key dates

- Technical Specification drafting completed by **January 19, 2026**
- Review of Technical Specification completed by **April 30, 2026**
- Project end date **May 31, 2026**

### Stages

Stages may complete before the due date, but must not exceed it. Work on
subsequent stages in some cases may start prior to the completion of previous
stages.

1. Stage 1: Preliminary - Circumstances for Use of TS (due April 14, 2025)
2. Stage 2: Initiation - New Work Item Proposal (due May 5, 2025)
3. Stage 3: Notice (due May 5, 2025)
4. Stage 4: Committee (due September 12, 2025)
5. Stage 5: Drafting (due January 19, 2026)
6. Stage 6: Approval (due April 30, 2026)
7. Stage 7: Publication (due May 28, 2026)
8. Stage 8: Maintenance (due May 28, 2026)

## Meeting Schedule

In general work will be conducted asynchronously; however, the Technical
Committee is expected to meet synchronously monthly.

Additional meetings between Technical Experts, the Technical Committee, and
other stakeholders may have meetings at other times as needed.

## Consensus Building

## Communication and Conduct

See: [Code of Conduct](CODE_OF_CONDUCT.md)

## Contributor Licence
- possibly use the one from [fluid](https://fluidproject.atlassian.net/wiki/spaces/fluid/pages/11547472/Fluid+Licensing)
- or the one from [ASC](https://accessible.canada.ca/creating-accessibility-standards/asc-62-accessible-equitable-artificial-intelligence-systems/2-asc-legal-notice), specifically section 2.5
- or elsewhere.

## Licence

See [LICENCE.md](LICENCE.md)

## Glossary

- **Technical Specification (TS):** A document which has been developed without
using the full consensus process that normally be associated with a National
Standard of Canada (NSC). This may be for cases such as an environment
undergoing rapid change. A Technical Specification is not a standard and does
not purport to be one. However, an NSC may be developed in the future to
supersede the Technical Specification.

