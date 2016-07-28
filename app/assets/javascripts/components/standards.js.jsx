var Standards = React.createClass({
    getInitialState() {
        return {
            standards: this.props.standards,
            standard: {
                name:''
            }
        }
    },

    render: function() {
        var that = this
        standards = this.state.standards.map( function(standard) {
            return (
                <Standard standard={standard} key={standard.id} onRemoveStandard = {that.handleStandardRemove}  />
            );
        });
        return (
            <div>
                <h1>Listing Standards</h1>
                <div id="standards">
                    <table>
                        <thead>
                        <tr>
                            <th>Standard Name</th>
                        </tr>
                        </thead>
                        <tbody>
                        {standards}
                        </tbody>
                    </table>
                    <input type="text" placeholder="Enter new standard" onChange={this.handleNameChange} /><br />
                    <button class="waves-effect waves-light btn" onClick={this.addNewStandard}>New Standard</button>
                </div>
            </div>
        );
    },

    handleNameChange(e) {
        var newStandard = this.state.standard;
        newStandard.name = e.target.value;
        this.setState({standard: newStandard});
    },

    addNewStandard() {
        var that = this;
        $.ajax({
            method: 'POST',
            data: {
                standard: that.state.standard,
            },
            url: 'standards/',
            success: function(res) {
                var newStandardList = that.state.standards;
                newStandardList.push(res);
                that.setState({
                    standards: newStandardList,
                    standard: {
                        name: ''
                    }
                });
            }
        });
    },

    handleStandardRemove(standard) {
        var standardList = this.state.standards.filter(function(item) {
            return standard.id !== item.id;
        });
        console.log(standardList)
        this.setState({
            standards: standardList
        });
    }

});
