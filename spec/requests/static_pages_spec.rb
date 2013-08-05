require 'spec_helper'

describe "StaticPages" do

	subject { page }

	shared_examples_for "all static pages" do
		it { should have_selector('h1', text: heading) }
		it { should have_title(full_title(page_title)) }
	end

	describe "Home page" do
			before { visit root_url }
			let(:heading) { 'NOS Management System' }
			let(:page_title) { '' }
			
			it_should_behave_like "all static pages"
			it { should have_link('Sign up now!', href: signup_path) }
	end

	describe "Help page" do
		before { visit help_path }
		let(:heading) { 'Information Center' }
		let(:page_title) { 'Help' }

		it { should have_content('Here are answers to frequently asked questions') }

		describe "the answer section" do

			it { should have_selector('#info-accordion') }

			it { should have_link('What is NOSSYM?', href: '#collapseOne') }
			it { should have_selector('#collapseOne', text: 'NOSSYM stands for') }

			it { should have_link('How do I fill out a form?', href: '#collapseTwo') }
			it { should have_selector('#collapseTwo', text: 'Filling out forms is simple and quick!') }

			it { should have_link('Who sees the information I submit?', href: '#collapseThree') }
			it { should have_selector('#collapseThree', text: 'Only necessary staff who are required') }
		end
	end
end # end_file
