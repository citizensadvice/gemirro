# -*- coding: utf-8 -*-
require 'spec_helper'
require 'gemirro/versions_fetcher'

# VersionsFetcher tests
module Gemirro
  describe 'VersionsFetcher' do
    include FakeFS::SpecHelpers

    before(:each) do
      @source = Source.new('RubyGems', 'https://rubygems.org')
      @fetcher = VersionsFetcher.new(@source)
    end

    it 'should be initialized' do
      expect(@fetcher.source).to be(@source)
    end

    it 'should fetch versions' do
      allow(@source).to receive(:fetch_versions).once.and_return([])
      allow(@source).to receive(:fetch_prerelease_versions).once.and_return([])
      allow(VersionsFile).to receive(:load).with('nothing', 'nothing')
      allow(File).to receive(:write).twice
      allow(File).to receive(:read).twice.and_return('nothing')
      expect(@fetcher.fetch).to be_nil
    end
  end
end
